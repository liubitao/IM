//
//  XHIMManger.m
//  Bt_ProtocolBuffer
//
//  Created by admin on 2021/1/16.
//

#import "XHIMManger.h"
#import "GCDAsyncSocket.h"
#import "XHIMConfiguration.h"
#import "XHIMMessageHead.h"
#import "Xhimlogin.pbobjc.h"

#import "CommonShop.pbobjc.h"   //自定义ProtoBuf 模型类头文件

@interface XHIMManger()<GCDAsyncSocketDelegate>

@property(nonatomic, strong) GCDAsyncSocket *asyncSocket;
@property(nonatomic, strong) XHIMConfiguration *configuration;
//接收服务器发过来的的data
@property (nonatomic, strong) NSMutableData *cacheReceiveData;

@property(nonatomic, copy) NSString *userId;
@property(nonatomic, copy) NSString *userSig;
@property(nonatomic, copy) XHIMSucc loginSuccBlock;
@property(nonatomic, copy) XHIMFail loginFailBlock;




@end
@implementation XHIMManger

+ (instancetype)manager
{
    static XHIMManger *imManger;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        imManger = [[[self class] alloc] init];
    });
    return imManger;
}

- (instancetype)init
{
    if (self = [super init]) {
        self.configuration = [XHIMConfiguration defaultConfiguration];
        self.asyncSocket = [[GCDAsyncSocket alloc] initWithDelegate:self delegateQueue:dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0)];
    }
    return self;
}

/** 获取登录状态 */
- (XHIMLoginStatus)getLoginStatus{
    if (self.asyncSocket.isConnected) {
        return XHTIM_STATUS_LOGINING;
    }else if (self.asyncSocket.isDisconnected){
        return XHTIM_STATUS_LOGOUT;
    }else{
        return XHTIM_STATUS_LOGINED;
    }
}

/** 获取登录用户 */
- (NSString *)getLoginUser{
    return self.userId;
}

/** 登录 */
- (void)login:(NSString *)userID userSig:(NSString *)userSig succ:(XHIMSucc)succ fail:(XHIMFail)fail{
    if (self.asyncSocket.isConnected)
    {
        if (succ) succ();
        return;
    }
    self.loginSuccBlock = succ;
    self.loginFailBlock = fail;
    
    NSError *error = nil;
    [self.asyncSocket connectToHost:self.configuration.socketHost onPort:self.configuration.socketPort withTimeout:self.configuration.connectTimeout error:&error];
    if (error) {
        if (fail) fail(error.code, error.localizedDescription);
    }
}

/** 退出登录 */
- (void)logout:(XHIMSucc)succ fail:(XHIMFail)fail{
    [self.asyncSocket disconnect];
    self.userId = nil;
    self.userSig = nil;
}

/** 给服务端发送消息 */
- (void)sendMessage:(ChatMsg *)msg{
//    NSData *data = [msg delimitedData]; //模型序列化
//    [self writeData:data timeout:self.configuration.sendTimeOut tag:0];
}

#pragma mark - ------GCDAsyncSocketDelegate--------
/** 和服务器建立了连接后回调 */
- (void)socket:(GCDAsyncSocket *)sock didConnectToHost:(NSString *)host port:(uint16_t)port
{
    NSLog(@"连接成功 : %@---%d",host,port);
    
    [self readDataWithTimeout:-1 tag:0];
    /// 连接成功之后，第一时间去登录
    [self sendLoginUser];
    [self runHeartbeat]; //发送心跳包

}

/** 断开连接 */
- (void)socketDidDisconnect:(GCDAsyncSocket *)sock withError:(NSError *)err
{
    NSLog(@"断开 socket连接 原因:%@",err);
    /// 超时重连
    if (err) {
        dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(self.configuration.reconnectDelay * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
            NSError *error = nil;
            [self.asyncSocket connectToHost:self.configuration.socketHost onPort:self.configuration.socketPort withTimeout:self.configuration.connectTimeout error:&error];
            if (error) {
                if (self.loginFailBlock) self.loginFailBlock(error.code, error.localizedDescription);
            }
        });
    }
}

/** 监听来自服务器的消息，处理 */
- (void)socket:(GCDAsyncSocket *)sock didReadData:(NSData *)data withTag:(long)tag
{
    NSLog(@"接收到tag = %ld : %ld 长度的数据",tag,data.length);
    [self recvData:data];
}

/** 给服务器发送消息后回调 */
- (void)socket:(GCDAsyncSocket *)sock didWriteDataWithTag:(long)tag
{
    NSLog(@"发送成功");
}

#pragma mark - private methods

/** 创建时钟器 发送心跳包 */

#pragma mark - ------发送数据--------
/** 给服务器发送数据 */
- (void)writeData:(NSData *)data{
    [_asyncSocket writeData:data withTimeout:self.configuration.sendTimeOut tag:0];
}

- (void)runHeartbeat{
    XHIMMessageHead *messageHead = [[XHIMMessageHead alloc] initWithBodyLength:0 withCode:HeartReqCode withContentData:nil];
    [self writeData:[messageHead convertInstanceToBytesData]];
}

- (void)sendLoginUser{
    XHImLoginRequest *loginRequest = [[XHImLoginRequest alloc] init];
    loginRequest.userId = self.userId;
    loginRequest.userSign = self.userSig;
    NSData *data = [loginRequest delimitedData];
    XHIMMessageHead *messageHead = [[XHIMMessageHead alloc] initWithBodyLength:0 withCode:LoginReqCode withContentData:data];
    [self writeData:[messageHead convertInstanceToBytesData]];
}

#pragma mark - ------读数据--------
- (void)readDataWithTimeout:(NSTimeInterval)timeout tag:(long)tag
{
    [_asyncSocket readDataWithTimeout:timeout tag:tag];
}

- (void)recvData:(NSData *)data{
    [self.cacheReceiveData appendData:data];
    /// 如果缓存的数据长度很长，可能还有下一个消息，需要继续拆包
    while (self.cacheReceiveData.length >= IMMessageHeadLength) {
        Byte *byteData = (Byte *)self.cacheReceiveData.bytes;
        UInt32 bodyLength = (UInt32)((byteData[0]&0xFF)<<24)|((byteData[1]&0xFF)<<16)|((byteData[2]&0xFF)<<8)|(byteData[3]&0xFF);
        UInt32 completeLength = bodyLength + 8;
        /// 缓存的数据没得传过来的数据大，此时需要等待下一个消息过来粘包
        if (self.cacheReceiveData.length < completeLength) {
            break;
        }
        /// 取出数据
        NSData * resultData = [self.cacheReceiveData subdataWithRange:NSMakeRange(0, completeLength)];
        /// 处理数据
        [self handleRecvData:resultData];
        /// 清空之前处理的消息
        [self.cacheReceiveData replaceBytesInRange:NSMakeRange(0, completeLength) withBytes:NULL length:0];
    }
    
    [self readDataWithTimeout:-1 tag:0];
}

- (void)handleRecvData:(NSData *)recvData{
    XHIMMessageHead *messageHead = [[XHIMMessageHead alloc] initWithData:recvData];
    switch (messageHead.code) {
        case HeartRespCode:
        {
            NSLog(@"心跳");
            dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(self.configuration.heartbeatInterval * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
                [self runHeartbeat];
            });
        }
            break;
        case LoginRespCode:
        {
            GPBCodedInputStream *inputStream = [GPBCodedInputStream streamWithData:messageHead.contentData];
            NSError *error;
            XHImLoginResponse *obj = [XHImLoginResponse parseDelimitedFromCodedInputStream:inputStream extensionRegistry:nil error:&error];
            if (!error) {
                NSLog(@"登录成功");
            }
        }
            break;
        default:
            break;
    }
}



/** 存储接收来自服务器的包 */
- (NSMutableData *)cacheReceiveData{
    if (_cacheReceiveData == nil){
        _cacheReceiveData = [[NSMutableData alloc] init];
    }
    return _cacheReceiveData;
}
    
- (void)dealloc
{
    _asyncSocket.delegate = nil;
    _asyncSocket = nil;
}



@end
