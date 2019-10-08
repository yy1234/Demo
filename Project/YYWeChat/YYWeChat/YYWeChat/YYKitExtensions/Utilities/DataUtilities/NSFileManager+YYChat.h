//
//  NSFileManager+YYChat.h
//  YYWeChat
//
//  Created by yang on 2019/7/14.
//  Copyright © 2019 XingYeTechnology. All rights reserved.
//


#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface NSFileManager (YYChat)

/**
 *  数据库 — 通用
 */
+ (NSString *)pathDBCommon;

/*
 数据库，聊天
 */
+ (NSString *)pathDBMessage;
@end

NS_ASSUME_NONNULL_END
