//
//  RedView.m
//  Quartz2D
//
//  Created by yang on 2019/5/5.
//  Copyright © 2019 XingYeTechnology. All rights reserved.
//

#import "RedView.h"

@implementation RedView

- (instancetype)initWithFrame:(CGRect)frame {
    if (self = [super initWithFrame:frame]) {
        self.backgroundColor = [UIColor redColor];
    }
    return self;
}

/*
 1.该方法将在view将要显示的时候
 */
-(void)drawRect:(CGRect)rect {
    
    NSLog(@"%s",__func__);
    //画圆
//    UIBezierPath *path = [UIBezierPath bezierPathWithRoundedRect:CGRectMake(50, 50, 100, 100) cornerRadius:50];
//    [[UIColor greenColor] set];
//    [path fill];
    //画椭圆
//    UIBezierPath *path = [UIBezierPath bezierPathWithOvalInRect:CGRectMake(50, 50, 100, 100)];
//    [[UIColor yellowColor] set];
//    [path fill];
   
    CGPoint center = CGPointMake(rect.size.width * 0.5, rect.size.height * 0.5);
    CGFloat radius = rect.size.width * 0.5 - 10;
    CGFloat startA = 0;
    CGFloat endA = -M_PI_2;
    
    UIBezierPath *path = [UIBezierPath bezierPathWithArcCenter:center radius:radius startAngle:startA endAngle:endA clockwise:NO];
    [path addLineToPoint:center];
    //封闭路径
//    [path closePath];
    [[UIColor blueColor] set];
    
    //fill会自动封闭路径
    [path fill];
    
}

//画矩形
- (void)drawRect {
    //1.获取上下文
    CGContextRef ctx = UIGraphicsGetCurrentContext();
    //2.描述路径
    UIBezierPath *path = [UIBezierPath bezierPathWithRect:CGRectMake(50, 50, 100, 100)];
    //3.把路径添加到上下文
    CGContextAddPath(ctx, path.CGPath);
    
    [[UIColor greenColor] set];
    CGContextSetLineWidth(ctx, 5);
    
    //4.上下文内容显示
//    CGContextFillPath(ctx);
    CGContextStrokePath(ctx);
}



- (void)drawLine {
    //1.获得一个和view相关联的上下文
    CGContextRef ctx = UIGraphicsGetCurrentContext();
    //2.描述路径
    UIBezierPath *path = [UIBezierPath bezierPath];
    
    //设置起点
    [path moveToPoint:CGPointMake(10, 100)];
    //添加某个线到一个点
    [path addLineToPoint:CGPointMake(200, 10)];
    //把上一条线的终点当作是下一条线的起点.
    [path addLineToPoint:CGPointMake(150, 200)];
    [path addLineToPoint:CGPointMake(10, 100)];
    
    
    //设置上下文的状态
    CGContextSetLineWidth(ctx, 10);
    //设置线的连接样式
    CGContextSetLineJoin(ctx, kCGLineJoinBevel);
    //设置顶角的样式
    CGContextSetLineCap(ctx, kCGLineCapRound);
    //设置线的颜色
    [[UIColor greenColor] setStroke];
    
    //3.把路径添加到上下文
    CGContextAddPath(ctx, path.CGPath);
    //4.把上下文的内容显示到view fill stroke上
    CGContextStrokePath(ctx);
}
@end
