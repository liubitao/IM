//
//  XHIMConfiguration.h
//  Bt_ProtocolBuffer
//
//  Created by admin on 2021/1/16.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface XHIMConfiguration : NSObject
+ (instancetype)defaultConfiguration;

@property(nonatomic, assign) NSInteger  connectTimeout;/// 连接超时
@property(nonatomic, assign) NSInteger  heartbeatInterval;/// 心跳间隔时间
@property(nonatomic, copy) NSString *socketHost;/// ip地址
@property(nonatomic, assign) UInt32 socketPort;/// 端口
@property(nonatomic, assign) NSInteger  reconnectDelay;/// 重连时间间隔
@property(nonatomic, assign) NSInteger  sendTimeOut;/// 消息发送超时

@end

NS_ASSUME_NONNULL_END
