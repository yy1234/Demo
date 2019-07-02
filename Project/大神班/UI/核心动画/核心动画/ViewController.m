//
//  ViewController.m
//  核心动画
//
//  Created by yang on 2019/5/7.
//  Copyright © 2019 XingYeTechnology. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()
@property (weak, nonatomic) IBOutlet UIImageView *imageV;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}


-(void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
    
    CABasicAnimation *anim = [CABasicAnimation animation];
   //设置属性
    anim.keyPath = @"transform.scale";
    //设置属性值
    anim.toValue = @0;
    //设置动画的执行次数
    anim.repeatCount = MAXFLOAT;
    //设置动画执行的时长
    anim.duration = 0.5;
    //自动反转
    anim.autoreverses = YES;
    [self.imageV.layer addAnimation:anim forKey:nil];
    
}
@end
