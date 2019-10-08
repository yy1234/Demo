//
//  YYLaunchManager.m
//  YYWeChat
//
//  Created by yang on 2019/7/8.
//  Copyright © 2019 XingYeTechnology. All rights reserved.
//

#import "YYLaunchManager.h"
#import <TLTabBarController/TLTabBarController.h>
#import "YYConversationViewController.h"
#import "YYAccountViewController.h"
#import "YYContanctsViewController.h"
#import "YYDiscoverViewController.h"
#import "YYMineViewController.h"
#import "YYAccountViewController.h"
#import "YYUserHelper.h"
@interface YYLaunchManager()
@property (nonatomic,strong)UIWindow *keyWindow;
@end
@implementation YYLaunchManager

+ (YYLaunchManager *)sharedInstance {
    static dispatch_once_t onceToken;
    static YYLaunchManager *manger;
    dispatch_once(&onceToken, ^{
        manger = [[self alloc] init];
    });
    return manger;
}

- (void)luanchInWidow:(UIWindow *)window {
    [self.tabBarController setViewControllers:[self p_createTabbarViewController]];
    self.keyWindow = window;
    [[UIApplication sharedApplication] setStatusBarStyle:UIStatusBarStyleLightContent];
    NSLog(@"path:%@",NSHomeDirectory());
    if ([YYUserHelper shareInstance].isLogin) {
        [self.tabBarController setViewControllers:[self p_createTabbarViewController]];
        [self setCurRootVC:self.tabBarController];

    }else {
        YYAccountViewController*rootVC = [[YYAccountViewController alloc] init];
        @weakify(self);
        rootVC.loginSus = ^{
            @strongify(self);
            [self luanchInWidow: window];
        };
        [self setCurRootVC:rootVC];
    }
    
//    UIWindow *window1 = self.keyWindow ? self.keyWindow : [UIApplication sharedApplication].keyWindow;
//    [window1 removeAllSubviews];
//    [window1 setRootViewController:rootVC];
//    [window1 addSubview:rootVC.view];
//    [window1 makeKeyAndVisible];
}

- (void)setCurRootVC:(__kindof UIViewController *)curRootVC
{
    _curRootVC = curRootVC;
    
    {
        UIWindow *window = self.keyWindow ? self.keyWindow : [UIApplication sharedApplication].keyWindow;
        [window removeAllSubviews];
        [window setRootViewController:curRootVC];
        [window addSubview:curRootVC.view];
        [window makeKeyAndVisible];
    }
}

- (NSArray<UIViewController *>*)p_createTabbarViewController {
    YYConversationViewController *conversation = [[YYConversationViewController alloc] init];
    YYContanctsViewController *contancts = [[YYContanctsViewController alloc] init];
    YYDiscoverViewController *discover = [[YYDiscoverViewController alloc] init];
    YYMineViewController *mine = [[YYMineViewController alloc] init];
    NSArray *vcArr = @[
                       conversation,
                       contancts,
                       discover,
                       mine
                       ];
    return vcArr;
}

#pragma mark lazyload
- (TLTabBarController *)tabBarController {
    if (!_tabBarController) {
        _tabBarController = [[TLTabBarController alloc] init];
    }
    return _tabBarController;
}
@end
