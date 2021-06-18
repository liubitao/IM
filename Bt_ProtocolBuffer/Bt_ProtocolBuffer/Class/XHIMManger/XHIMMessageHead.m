//
//  XHIMMessageHead.m
//  Bt_ProtocolBuffer
//
//  Created by admin on 2021/1/16.
//

#import "XHIMMessageHead.h"




@implementation XHIMMessageHead

- (instancetype)initWithBodyLength:(UInt32)bodyLength withCode:(UInt32)code withContentData:(nullable NSData *)contentData{
    if (self = [super init]) {
        self.bodyLength = bodyLength;
        self.code = code;
        self.contentData = contentData;
    }
    return self;
}

- (instancetype)initWithData:(NSData *)headData{
    if (self = [super init]) {
        Byte *byteData = (Byte *)headData.bytes;
        self.bodyLength = (UInt32)((byteData[0]&0xFF)<<24)|((byteData[1]&0xFF)<<16)|((byteData[2]&0xFF)<<8)|(byteData[3]&0xFF);
        self.code = (UInt32)((byteData[4]&0xFF)<<24)|((byteData[5]&0xFF)<<16)|((byteData[6]&0xFF)<<8)|(byteData[7]&0xFF);
        if (headData.length != 8 && headData.length == (self.bodyLength + IMMessageHeadLength)) {
            self.contentData = [headData subdataWithRange:NSMakeRange(IMMessageHeadLength, self.bodyLength)];
        }
    }
    return self;
}

- (NSData *)convertInstanceToBytesData{
    Byte byteData[8] = {};
    byteData[0] =(Byte)((self.bodyLength & 0xFF000000)>>24);
    byteData[1] =(Byte)((self.bodyLength & 0x00FF0000)>>16);
    byteData[2] =(Byte)((self.bodyLength & 0x0000FF00)>>8);
    byteData[3] =(Byte)((self.bodyLength & 0x000000FF));
    
    byteData[4] =(Byte)((self.code & 0xFF000000)>>24);
    byteData[5] =(Byte)((self.code & 0x00FF0000)>>16);
    byteData[6] =(Byte)((self.code & 0x0000FF00)>>8);
    byteData[7] =(Byte)((self.code & 0x000000FF));
    
    NSMutableData *data = [NSMutableData dataWithBytes:byteData length:8];
    if (self.contentData.length > 0) {
        [data appendData:self.contentData];
    }
    return data;
}
@end
