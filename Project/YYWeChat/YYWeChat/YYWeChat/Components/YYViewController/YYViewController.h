//
//  YYViewController.h
//  YYWeChat
//
//  Created by yang on 2019/7/8.
//  Copyright © 2019 XingYeTechnology. All rights reserved.
//


#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface YYViewController : UIViewController
/// 当前VC stutusBar的状态，仅在viewWillAppear时生效，默认LightContent
@property (nonatomic, assign) UIStatusBarStyle statusBarStyle;

@property (nonatomic, strong) NSString *analyzeTitle;

@end

NS_ASSUME_NONNULL_END
