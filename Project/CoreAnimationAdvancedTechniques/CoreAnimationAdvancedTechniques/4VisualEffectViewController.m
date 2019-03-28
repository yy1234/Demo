//
//  4VisualEffectViewController.m
//  CoreAnimationAdvancedTechniques
//
//  Created by yang on 2019/3/27.
//  Copyright © 2019 XingYeTechnology. All rights reserved.
//

#import "4VisualEffectViewController.h"

@interface _VisualEffectViewController ()
@property (weak, nonatomic) IBOutlet UIView *layerView1;
@property (weak, nonatomic) IBOutlet UIView *layerView2;

@property (weak, nonatomic) IBOutlet UIView *shadowView;

@property (weak, nonatomic) IBOutlet UIView *shaowPath1;
@property (weak, nonatomic) IBOutlet UIView *shaowPAth2;

@property (weak, nonatomic) IBOutlet UIImageView *imageView;
@end

@implementation _VisualEffectViewController

- (void)viewDidLoad {
    [super viewDidLoad];
#pragma mark cornerRadius和masksToBounds
    self.layerView1.layer.cornerRadius = 20;
    self.layerView2.layer.cornerRadius = 20;

    //add a border to our layers
    self.layerView1.layer.borderWidth = 5.0f;
    self.layerView2.layer.borderWidth = 5.0f;

    //add a shadow to layerView1
    self.layerView1.layer.shadowOpacity = 0.5f;
    self.layerView1.layer.shadowOffset = CGSizeMake(0.0f, 5.0f);
    self.layerView1.layer.shadowRadius = 5.0f;
    
    //add same shadow to shadowView (not layerView2)
    //masksToBounds会把阴影给裁剪掉，这里采取的是在底部加一个透明视图，设置透明视图的阴影
    self.shadowView.layer.shadowOpacity = 0.5f;
    self.shadowView.layer.shadowOffset = CGSizeMake(0.0f, 5.0f);
    self.shadowView.layer.shadowRadius = 5.0f;
    
    self.layerView2.layer.masksToBounds = YES;

    /*
     shadowOpacity就会有层阴影，
     shadowColor，shadowOffset和shadowRadius。
     shadowColor：控制显示的颜色，
     shadowOffset：属性控制着阴影的方向和距离ios上默认{0,-3}
     shadowRadius：属性控制着阴影的模糊度，当它的值是0的时候，阴影就和视图一样有一个非常确定的边界线。当值越来越大的时候，边界线看上去就会越来越模糊和自然。
     */
//    self.shadowView.layer.shadowOpacity = 0.7;
//    self.shadowView.layer.shadowOffset = CGSizeMake(1, 3);
//    self.shadowView.layer.shadowRadius = 15;
    
#pragma mark shadowPath
    self.shaowPath1.layer.shadowOpacity = 0.5;
    self.shaowPAth2.layer.shadowOpacity = 0.5;
    self.shaowPath1.backgroundColor = UIColor.clearColor;
    self.shaowPAth2.backgroundColor = UIColor.clearColor;
    
    CGMutablePathRef squarePath = CGPathCreateMutable();
    CGPathAddRect(squarePath, NULL, self.shaowPath1.bounds);
    self.shaowPath1.layer.shadowPath = squarePath;
    CGPathRelease(squarePath);
    

    CGMutablePathRef circlePath = CGPathCreateMutable();
    CGPathAddEllipseInRect(circlePath, NULL, self.shaowPAth2.bounds);
    self.shaowPAth2.layer.shadowPath = circlePath;
    CGPathRelease(circlePath);
    
    //mask
    CALayer *maskLayer = [CALayer layer];
    maskLayer.frame = self.imageView.bounds;
    UIImage *maskImage = [UIImage imageNamed:@"ss.png"];
    maskLayer.contents = (__bridge id)maskImage.CGImage;
    self.imageView.layer.mask = maskLayer;
    
    
}



@end
