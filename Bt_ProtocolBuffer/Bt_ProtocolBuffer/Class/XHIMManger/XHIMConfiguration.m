//
//  XHIMConfiguration.m
//  Bt_ProtocolBuffer
//
//  Created by admin on 2021/1/16.
//

#import "XHIMConfiguration.h"
@interface XHIMConfiguration()




@end
@implementation XHIMConfiguration
+ (instancetype)defaultConfiguration{
    static XHIMConfiguration *configuration;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        configuration = [[[self class] alloc] init];
    });
    return configuration;
}
- (instancetype)init
{
    self = [super init];
    if (self) {
        self.connectTimeout = 60 * 5;
        self.heartbeatInterval = 5;
        self.socketHost = @"10.10.38.109";
        self.socketPort = 11211;
        self.reconnectDelay = 2;
        self.sendTimeOut = 5;
    }
    return self;
}

@end
