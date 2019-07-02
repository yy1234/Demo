//
//  PieView.m
//  进度条
//
//  Created by yang on 2019/5/5.
//  Copyright © 2019 XingYeTechnology. All rights reserved.
//

#import "PieView.h"

@implementation PieView

-(void)drawRect:(CGRect)rect {
    NSArray *dataSouce = @[@25,@25,@25,@25];
    CGPoint center = CGPointMake(rect.size.width * 0.5, rect.size.height * 0.5);
    CGFloat radius = rect.size.width * 0.5 - 10;
    CGFloat startA = 0;
    CGFloat endA = 0;
    for (NSNumber *num in dataSouce) {
        CGFloat rate = num.intValue;
        startA = endA;
        endA = startA + rate/100 * M_PI * 2;
        UIBezierPath *path = [UIBezierPath bezierPathWithArcCenter:center radius:radius startAngle:startA endAngle:endA clockwise:YES];
       //连接终点到圆心
        [path addLineToPoint:center];
        [[self randomColor] set];
        [path fill];
    }
}


//随机生成一个颜色
- (UIColor *)randomColor{
    
    CGFloat r = arc4random_uniform(256) / 255.0;
    CGFloat g = arc4random_uniform(256) / 255.0;
    CGFloat b = arc4random_uniform(256) / 255.0;
    
    //0-255.
    //    colorWithRed  0-1
    return [UIColor colorWithRed:r green:g blue:b alpha:1];
}

@end
