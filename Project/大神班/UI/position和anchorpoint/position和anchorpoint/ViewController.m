//
//  ViewController.m
//  position和anchorpoint
//
//  Created by yang on 2019/5/6.
//  Copyright © 2019 XingYeTechnology. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@property(nonatomic,strong)CALayer *layer;
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];

    CALayer *layer= [CALayer layer];
    layer.bounds = CGRectMake(0, 0, 100, 100);
    layer.backgroundColor = [UIColor redColor].CGColor;
    layer.anchorPoint = CGPointMake(0, 0);
    self.layer = layer;
    [self.view.layer addSublayer:layer];
}



- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event{
    //开启一个事务
    [CATransaction begin];
     //不需要隐式动画
//   [CATransaction setDisableActions:YES];

    [CATransaction setAnimationDuration:5];
    //手动创建的layer，会有一个隐式动画
    self.layer.bounds = CGRectMake(100, 100, 200, 300);
    
    [CATransaction commit];
}

@end
