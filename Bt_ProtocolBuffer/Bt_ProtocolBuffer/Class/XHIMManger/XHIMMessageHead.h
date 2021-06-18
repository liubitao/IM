//
//  XHIMMessageHead.h
//  Bt_ProtocolBuffer
//
//  Created by admin on 2021/1/16.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

#define IMMessageHeadLength        8

#define HeartReqCode            1001
#define HeartRespCode            1002
#define LoginReqCode            1003
#define LoginRespCode            1004


@interface XHIMMessageHead : NSObject
@property(nonatomic, assign) UInt32  bodyLength;
@property(nonatomic, assign) UInt32  code;
@property(nonatomic, strong) NSData *contentData;

- (instancetype)initWithBodyLength:(UInt32)bodyLength withCode:(UInt32)code withContentData:(nullable NSData *)contentData;

- (instancetype)initWithData:(NSData *)headData;

- (NSData *)convertInstanceToBytesData;



@end

NS_ASSUME_NONNULL_END
