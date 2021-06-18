//
//  ViewController.m
//  Bt_ProtocolBuffer
//
//  Created by admin on 2021/1/16.
//

#import "ViewController.h"
#import "XHIMManger.h"


@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [[XHIMManger manager] login:@"" userSig:@"" succ:^{
        NSLog(@"登录成功");
    } fail:^(NSInteger code, NSString * _Nonnull desc) {
        NSLog(@"%ld, %@", (long)code, desc);
    }];
}


- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event{
//    [[XHIMManger manager] logout:nil fail:nil];
}

@end
