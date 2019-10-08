//
//  YYUserSetting.h
//  YYWeChat
//
//  Created by yang on 2019/7/12.
//  Copyright © 2019 XingYeTechnology. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface YYUserSetting : NSObject

@property (nonatomic, strong) NSString *userID;

@property (nonatomic, assign) BOOL star;

@property (nonatomic, assign) BOOL dismissTimeLine;

@property (nonatomic, assign) BOOL prohibitTimeLine;

@property (nonatomic, assign) BOOL blackList;

@end

NS_ASSUME_NONNULL_END
