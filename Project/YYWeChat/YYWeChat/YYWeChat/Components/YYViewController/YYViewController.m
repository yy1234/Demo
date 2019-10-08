//
//  YYViewController.m
//  YYWeChat
//
//  Created by yang on 2019/7/8.
//  Copyright © 2019 XingYeTechnology. All rights reserved.
//

#import "YYViewController.h"

@interface YYViewController ()

@end

@implementation YYViewController

- (instancetype)init
{
    if (self = [super init]) {
        [self setStatusBarStyle:UIStatusBarStyleLightContent];
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    [self.view setBackgroundColor:[UIColor colorGrayBG]];
}

- (void)viewWillDisappear:(BOOL)animated {
    [super viewWillDisappear:animated];
    [MobClick endLogPageView:self.analyzeTitle];
}

- (void)dealloc
{
#ifdef DEBUG_MEMERY
    NSLog(@"dealloc %@", self.navigationItem.title);
#endif
}
- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    
    [MobClick beginLogPageView:self.analyzeTitle];
    if ([UIApplication sharedApplication].statusBarStyle != self.statusBarStyle) {
        [UIApplication sharedApplication].statusBarStyle = self.statusBarStyle;
    }
}


#pragma mark - # Getter
- (NSString *)analyzeTitle
{
    if (_analyzeTitle == nil) {
        return self.navigationItem.title;
    }
    return _analyzeTitle;
}


@end
