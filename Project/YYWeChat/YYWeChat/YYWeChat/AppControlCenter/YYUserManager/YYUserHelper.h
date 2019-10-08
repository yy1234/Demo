//
//  YYUserManager.h
//  YYWeChat
//
//  Created by yang on 2019/7/12.
//  Copyright © 2019 XingYeTechnology. All rights reserved.
//

#import <Foundation/Foundation.h>
@class YYUser;
NS_ASSUME_NONNULL_BEGIN

@interface YYUserHelper : NSObject

@property (nonatomic,strong)YYUser *user;

@property (nonatomic, strong, readonly) NSString *userID;

@property (nonatomic, assign, readonly) BOOL isLogin;

+ (YYUserHelper *)shareInstance;

- (void)loginTestAccount;

@end

NS_ASSUME_NONNULL_END
