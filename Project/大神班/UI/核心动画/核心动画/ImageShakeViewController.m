//
//  ImageShakeViewController.m
//  核心动画
//
//  Created by yang on 2019/5/7.
//  Copyright © 2019 XingYeTechnology. All rights reserved.
//

#import "ImageShakeViewController.h"
#define angle2Rad(angle) ((angle) / 180.0 * M_PI)

@interface ImageShakeViewController ()
@property (weak, nonatomic) IBOutlet UIImageView *imageV;

@end

@implementation ImageShakeViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

-(void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
    //创建一个关键帧动画(改变路径)
    CAKeyframeAnimation *anim = [CAKeyframeAnimation animation];
   //设置属性
    anim.keyPath = @"transform.rotation";
    //设置属性值
    anim.values = @[@(angle2Rad(-5)),@(angle2Rad(5)),@(angle2Rad(-5))];
    //设置执行次数
    anim.repeatCount = MAXFLOAT;
    [[UIColor yellowColor] set];
    anim.duration = 0.5;
    [self.imageV.layer addAnimation:anim forKey:nil];
    
}
- (IBAction)sround:(id)sender {
    CAKeyframeAnimation *anim = [CAKeyframeAnimation animation];
    anim.keyPath = @"position";
    UIBezierPath *path = [UIBezierPath bezierPathWithOvalInRect:CGRectMake(50, 50, 300, 300)];
    anim.path = path.CGPath;
    
    anim.repeatCount = MAXFLOAT;
    anim.autoreverses = YES;
    anim.duration = 2;
    [self.imageV.layer addAnimation:anim forKey:nil];
    
    
}

@end
