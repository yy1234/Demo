//
//  AnimationGroupViewController.m
//  核心动画
//
//  Created by yang on 2019/5/7.
//  Copyright © 2019 XingYeTechnology. All rights reserved.
//

#import "AnimationGroupViewController.h"

@interface AnimationGroupViewController ()
@property (weak, nonatomic) IBOutlet UIImageView *redView;

@end

@implementation AnimationGroupViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
    CAAnimationGroup *group = [CAAnimationGroup animation];
    
    //缩放
    CABasicAnimation *scaleAim = [CABasicAnimation animation];
    scaleAim.keyPath = @"transform.scale";
    scaleAim.toValue  =@0.5;
    
    //平移
    CABasicAnimation *Anim = [CABasicAnimation animation];
    //设置属性
    Anim.keyPath = @"position.y";
    Anim.toValue = @(400);
    group.animations = @[scaleAim,Anim];
    
    group.removedOnCompletion = NO;
    
    group.fillMode = kCAFillModeForwards;
    
    [self.redView.layer addAnimation:group forKey:nil];
}

@end
