//
//  XHIMManger.h
//  Bt_ProtocolBuffer
//
//  Created by admin on 2021/1/16.
//

#import <Foundation/Foundation.h>
@class ChatMsg;   //自定义Protobuf模型类

NS_ASSUME_NONNULL_BEGIN
/** 成功回调 */
typedef void(^XHIMSucc)(void);
/** 失败回调 */
typedef void (^XHIMFail)(NSInteger code, NSString * desc);

/// 登录状态
typedef NS_ENUM(NSInteger, XHIMLoginStatus) {
    XHTIM_STATUS_LOGINED                   = 1,  ///< 已登录
    XHTIM_STATUS_LOGINING                  = 2,  ///< 登录中
    XHTIM_STATUS_LOGOUT                    = 3,  ///< 无登录
};



@interface XHIMManger : NSObject
+ (instancetype)manager;  //获取实例对象

/** 获取登录状态 */
- (XHIMLoginStatus)getLoginStatus;

/** 获取登录用户 */
- (NSString *)getLoginUser;

/** 登录 */
- (void)login:(NSString *)userID userSig:(NSString *)userSig succ:(XHIMSucc)succ fail:(XHIMFail)fail;

/** 退出登录 */
- (void)logout:(XHIMSucc)succ fail:(XHIMFail)fail;

- (void)sendMessage:(ChatMsg *)msg;

@end

NS_ASSUME_NONNULL_END
