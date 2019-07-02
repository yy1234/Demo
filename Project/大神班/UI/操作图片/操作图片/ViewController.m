//
//  ViewController.m
//  操作图片
//
//  Created by yang on 2019/5/6.
//  Copyright © 2019 XingYeTechnology. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()
@property (weak, nonatomic) IBOutlet UIImageView *imageView;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];

    UIImage *image = [UIImage imageNamed:@"卡哇伊"];
    
    
    /*
     //  生成和图片大小相同的上下文
     第一个参数：生成上线文的大小
     第二个参数：
     第三个参数：缩放
   
   
    UIGraphicsBeginImageContextWithOptions(image.size, NO, 0.0);
    
    //画图片
    [image drawAtPoint:CGPointZero];
    
    //画文字
    [@"YY" drawAtPoint:CGPointZero withAttributes:@{NSFontAttributeName:[UIFont systemFontOfSize:15.0]}];
    
    //生成d图片
    UIImage *otherImage = UIGraphicsGetImageFromCurrentImageContext();
    
    //关闭上下文
    UIGraphicsEndImageContext();

    self.imageView.image = otherImage;
    */
    
    
    /*
    //裁剪
    UIGraphicsBeginImageContextWithOptions(image.size, NO, 0);
    UIBezierPath *path = [UIBezierPath bezierPathWithOvalInRect:CGRectMake(0, 0, image.size.width, image.size.height)];
    
    [path addClip];
    [image drawAtPoint:CGPointZero];
    UIImage *otherImage = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    self.imageView.image = otherImage;
  */
    CGFloat borderW = 10;
    CGSize size = CGSizeMake(image.size.width + 2 * borderW, image.size.height + 2 * borderW);
    //设置圆形图片
    UIGraphicsBeginImageContextWithOptions(size, NO, 0.0);
    CGFloat width = size.width;
    CGFloat height = size.height;
    UIBezierPath *path = [UIBezierPath bezierPathWithOvalInRect:CGRectMake(0, 0, width, height)];
    [[UIColor greenColor] set];
    [path fill];
    
    path = [UIBezierPath bezierPathWithOvalInRect:CGRectMake(borderW, borderW, image.size.width, image.size.height)];
    [path addClip];
    
//    [image drawAtPoint:CGPointZero];
    [image drawInRect:CGRectMake(borderW, borderW, image.size.width, image.size.height)];
    UIImage *otherImage = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    self.imageView.image = otherImage;
    
    
    
}


@end
