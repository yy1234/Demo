//
//  YYDBUserStore.h
//  YYWeChat
//
//  Created by yang on 2019/7/14.
//  Copyright © 2019 XingYeTechnology. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "YYDBBaseStore.h"
@class YYUser;
NS_ASSUME_NONNULL_BEGIN

@interface YYDBUserStore : YYDBBaseStore
///更新用户信息
- (BOOL)updateUser: (YYUser *)user;

//获取用户信息
- (YYUser *)userByID: (NSString *)userID;

//查询所有用户的信息
- (NSArray *)userData;

//删除用户
- (BOOL)deleteUserByUid: (NSString *)uid;


@end

NS_ASSUME_NONNULL_END
