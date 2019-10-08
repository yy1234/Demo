//
//  YYUser.h
//  YYWeChat
//
//  Created by yang on 2019/7/12.
//  Copyright © 2019 XingYeTechnology. All rights reserved.
//

#import <Foundation/Foundation.h>
@class YYUserDetail;
@class YYUserSetting;
@class YYUserChatSetting;

NS_ASSUME_NONNULL_BEGIN

@interface YYUser : NSObject

/// 用户ID
@property (nonatomic, strong) NSString *userID;

/// 用户名
@property (nonatomic, strong) NSString *username;

/// 昵称
@property (nonatomic, strong) NSString *nikeName;

/// 头像URL
@property (nonatomic, strong) NSString *avatarURL;

/// 头像Path
@property (nonatomic, strong) NSString *avatarPath;

/// 备注名
@property (nonatomic, strong) NSString *remarkName;

/// 界面显示名称
@property (nonatomic, strong, readonly) NSString *showName;


#pragma mark - 其他
@property (nonatomic, strong) YYUserDetail *detailInfo;

@property (nonatomic, strong) YYUserSetting *userSetting;

@property (nonatomic, strong) YYUserChatSetting *chatSetting;


#pragma mark - 列表用
/**
 *  拼音
 *
 *  来源：备注 > 昵称 > 用户名
 */
@property (nonatomic, strong) NSString *pinyin;

@property (nonatomic, strong) NSString *pinyinInitial;
@end

NS_ASSUME_NONNULL_END
