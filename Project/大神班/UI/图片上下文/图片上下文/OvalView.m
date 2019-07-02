//
//  OvalView.m
//  图片上下文
//
//  Created by yang on 2019/5/6.
//  Copyright © 2019 XingYeTechnology. All rights reserved.
//

#import "OvalView.h"

@implementation OvalView


// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    CGContextRef ctx = UIGraphicsGetCurrentContext();
    UIBezierPath *path = [UIBezierPath bezierPathWithOvalInRect:CGRectMake(-50, -50, 200, 100)];
    
    CGContextSetLineWidth(ctx, 5);
    [[UIColor redColor] set];
    
    //上下文的操作，必须在矩阵的操作之前
    //平移
    CGContextTranslateCTM(ctx, 100, 100);
    //缩放
    CGContextScaleCTM(ctx, 0.5, 0.5);
    //旋转
    CGContextRotateCTM(ctx, M_PI_4);
    
    
     CGContextAddPath(ctx, path.CGPath);
    CGContextStrokePath(ctx);
}


@end
