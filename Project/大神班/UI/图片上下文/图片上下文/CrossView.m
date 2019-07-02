//
//  CrossView.m
//  图片上下文
//
//  Created by yang on 2019/5/5.
//  Copyright © 2019 XingYeTechnology. All rights reserved.
//

#import "CrossView.h"

@implementation CrossView


// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
    //获取上下文
    CGContextRef ctx = UIGraphicsGetCurrentContext();
    
    //添加路径
    UIBezierPath *path = [UIBezierPath bezierPath];
    [path moveToPoint:CGPointMake(10, 120)];
    [path addLineToPoint:CGPointMake(310, 120)];
    
 
      //把当前的状态保存到图片上下文状态栈里(注意顺序)
    CGContextSaveGState(ctx);
    
    CGContextSetLineWidth(ctx, 5);
    [[UIColor redColor] set];
    //添加路径
    CGContextAddPath(ctx, path.CGPath);
    //绘制路径
    CGContextStrokePath(ctx);
    
    
    
    
    //从新创建一个画笔
    path = [UIBezierPath bezierPath];
    [path moveToPoint:CGPointMake(rect.size.width/2, 20)];
    [path addLineToPoint:CGPointMake(rect.size.width/2, rect.size.height - 30)];
      //把当前的状态保存到图片上下文状态栈里
    CGContextRestoreGState(ctx);

    //添加路径
    CGContextAddPath(ctx, path.CGPath);
    //绘制路径
    CGContextStrokePath(ctx);
    
    
}


@end
