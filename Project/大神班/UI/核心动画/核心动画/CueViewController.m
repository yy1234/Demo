//
//  CueViewController.m
//  核心动画
//
//  Created by yang on 2019/5/7.
//  Copyright © 2019 XingYeTechnology. All rights reserved.
//

#import "CueViewController.h"

@interface CueViewController ()
@property (strong, nonatomic) IBOutlet UIImageView *imageV;

@end

@implementation CueViewController

- (void)viewDidLoad {
    [super viewDidLoad];



}

static int _i = 1;
-(void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
    /*
    //创建动画
    CATransition *anim = [CATransition animation];
    
    //设置转场类型
    anim.type = @"push";
    
    anim.subtype = kCATransitionFromRight;
    
    anim.duration = 0.5;
    
    [self.imageV.layer addAnimation:anim forKey:nil];
    
    _i++;
    if (_i > 3) {
        _i = 1;
    }
    NSString *imageName = [NSString stringWithFormat:@"%d",_i];
    self.imageV.image = [UIImage imageNamed:imageName];
    */
    
    [UIView transitionWithView:self.imageV duration:1 options:UIViewAnimationOptionTransitionCurlUp animations:^{
        _i++;
        if (_i > 3) {
            _i = 1;
        }
        NSString *imageName = [NSString stringWithFormat:@"%d",_i];
        self.imageV.image = [UIImage imageNamed:imageName];
    } completion:nil];
    
}

@end
