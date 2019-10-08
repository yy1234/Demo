//
//  YYAccountManager.m
//  YYWeChat
//
//  Created by yang on 2019/7/12.
//  Copyright © 2019 XingYeTechnology. All rights reserved.
//

#import "YYAccountManager.h"

@implementation YYAccountManager

+ (instancetype)shareInstance {
    static dispatch_once_t onceToken;
    static YYAccountManager *manger = nil;
    dispatch_once(&onceToken, ^{
        manger = [[self alloc] init];
    });
    return manger;
}
@end
