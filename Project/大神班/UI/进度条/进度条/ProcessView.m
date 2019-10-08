//
//  ProcessView.m
//  进度条
//
//  Created by yang on 2019/5/5.
//  Copyright © 2019 XingYeTechnology. All rights reserved.
//

#import "ProcessView.h"

@implementation ProcessView

-(void)setProcess:(CGFloat)process {
    _process = process;
    [self setNeedsDisplay];
}

-(void)drawRect:(CGRect)rect {
    
    CGPoint center = CGPointMake(rect.size.width * 0.5, rect.size.height * 0.5);
    CGFloat startA = -M_PI_2;
    CGFloat endA = -M_PI_2 + self.process * M_PI * 2;
    CGFloat raduis = rect.size.width/2 - 30;
    UIBezierPath *path = [UIBezierPath bezierPathWithArcCenter:center radius:raduis startAngle:startA endAngle:endA clockwise:YES];
    path.lineWidth = 5;
    [path stroke];
}

@end
