//
//  YYLaunchManager.h
//  YYWeChat
//
//  Created by yang on 2019/7/8.
//  Copyright © 2019 XingYeTechnology. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>
NS_ASSUME_NONNULL_BEGIN
@class TLTabBarController;
@interface YYLaunchManager : NSObject

+ (YYLaunchManager *)sharedInstance;
/// 当前根控制器
@property (nonatomic, strong, readonly) __kindof UIViewController *curRootVC;

/// 根tabBarController
@property (strong,nonatomic)TLTabBarController *tabBarController;
/**
 启动
 */
- (void)luanchInWidow:(UIWindow *)window;

- (instancetype)init NS_UNAVAILABLE;
+ (instancetype)new NS_UNAVAILABLE;
@end

NS_ASSUME_NONNULL_END
