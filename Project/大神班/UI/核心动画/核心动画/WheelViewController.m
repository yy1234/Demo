//
//  WheelViewController.m
//  核心动画
//
//  Created by yang on 2019/5/8.
//  Copyright © 2019 XingYeTechnology. All rights reserved.
//

#import "WheelViewController.h"
#import "WheelView.h"
@interface WheelViewController ()

@end

@implementation WheelViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    WheelView *view = [[WheelView alloc] initWithFrame:CGRectMake(0, 0, 286, 286)];
    view.center = self.view.center;
    [self.view addSubview:view];

}


@end
