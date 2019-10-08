//
//  YYUserChatSetting.h
//  YYWeChat
//
//  Created by yang on 2019/7/12.
//  Copyright © 2019 XingYeTechnology. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface YYUserChatSetting : NSObject

@property (nonatomic, strong) NSString *userID;

@property (nonatomic, assign) BOOL top;

@property (nonatomic, assign) BOOL noDisturb;

@property (nonatomic, strong) NSString *chatBGPath;
@end

NS_ASSUME_NONNULL_END
