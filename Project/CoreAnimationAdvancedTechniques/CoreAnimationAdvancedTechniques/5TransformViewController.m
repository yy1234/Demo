//
//  5TransformViewController.m
//  CoreAnimationAdvancedTechniques
//
//  Created by yang on 2019/3/28.
//  Copyright © 2019 XingYeTechnology. All rights reserved.
//

#import "5TransformViewController.h"

@interface _TransformViewController ()
@property (weak, nonatomic) IBOutlet UIImageView *layerView;
@property (weak, nonatomic) IBOutlet UIView *containerView;
@property (weak, nonatomic) IBOutlet UIImageView *layerView1;
@property (weak, nonatomic) IBOutlet UIImageView *layerView2;

@end

@implementation _TransformViewController

- (void)viewDidLoad {
    [super viewDidLoad];
/*
 CGAffineTransformMakeRotation(CGFloat angle)
 CGAffineTransformMakeScale(CGFloat sx, CGFloat sy)
 CGAffineTransformMakeTranslation(CGFloat tx, CGFloat ty)
 */
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(3 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
        CGAffineTransform transform = CGAffineTransformMakeRotation(M_PI_4);
//        self.layerView.layer.affineTransform = transform;
    });

#pragma mark 混合变换
    
    /*
     图片向右边发生了平移，但并没有指定距离那么远（200像素），另外它还有点向下发生了平移。原因在于当你按顺序做了变换，上一个变换的结果将会影响之后的变换，所以200像素的向右平移同样也被旋转了30度，缩小了50%，所以它实际上是斜向移动了100像素。
     
     这意味着变换的顺序会影响最终的结果，也就是说旋转之后的平移和平移之后的旋转结果可能不同
     */
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(3 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
//        CGAffineTransform transform1 =  CGAffineTransformIdentity;
//        transform1 = CGAffineTransformScale(transform1, 0.5, 0.5);
//        transform1 = CGAffineTransformRotate(transform1, M_PI / 180.0 * 30.0); //rotate by 30 degrees
//        transform1 = CGAffineTransformTranslate(transform1, 200, 0);
//        self.layerView.layer.affineTransform = transform1;
    });
  
#pragma mark 斜切变换
    
//    self.layerView.layer.affineTransform = CGAffineTransformMakeShear(1, 0);

#pragma mark 3D变换
    /*
     CATransform3DMakeRotation(CGFloat angle, CGFloat x, CGFloat y, CGFloat z)
     CATransform3DMakeScale(CGFloat sx, CGFloat sy, CGFloat sz)
     CATransform3DMakeTranslation(Gloat tx, CGFloat ty, CGFloat tz)
     */
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(3 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
       /*对视图内的图层绕Y轴做了45度角的旋转
        
        看起来图层并没有被旋转，而是仅仅在水平方向上的一个压缩，是哪里出了问题呢？
        其实完全没错，视图看起来更窄实际上是因为我们在用一个斜向的视角看它，而不是透视。
        */
//        CATransform3D transform = CATransform3DMakeRotation(M_PI_4, 0, 1, 0);
//        self.layerView.layer.transform = transform;
    });

#pragma mark 透视投影
    //create a new transform
    CATransform3D transform = CATransform3DIdentity;
    //apply perspective
    transform.m34 = - 1.0 / 500.0;
    //rotate by 45 degrees along the Y axis
    transform = CATransform3DRotate(transform, M_PI_4, 0, 1, 0);
    //apply to layer
    self.layerView.layer.transform = transform;
    
    #pragma mark sublayerTransform属性
    CATransform3D perspective = CATransform3DIdentity;
    //如果有多个视图或者图层，每个都做3D变换，那就需要分别设置相同的m34值，并且确保在变换之前都在屏幕中央共享同一个position，如果用一个函数封装这些操作的确会更加方便
    perspective.m34 = - 1.0 / 500.0;
    self.containerView.layer.sublayerTransform = perspective;
    //rotate layerView1 by 45 degrees along the Y axis
    CATransform3D transform1 = CATransform3DMakeRotation(M_PI_4, 0, 1, 0);
    self.layerView1.layer.transform = transform1;
    //rotate layerView2 by 45 degrees along the Y axis
    CATransform3D transform2 = CATransform3DMakeRotation(-M_PI_4, 0, 1, 0);
    self.layerView2.layer.transform = transform2;
    
#pragma mark 背面
    
    

}





CGAffineTransform CGAffineTransformMakeShear(CGFloat x, CGFloat y)
{
    CGAffineTransform transform = CGAffineTransformIdentity;
    transform.c = -x;
    transform.b = y;
    return transform;
}
@end
