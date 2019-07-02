//
//  SnowView.m
//  UIKit绘制图片
//
//  Created by yang on 2019/5/5.
//  Copyright © 2019 XingYeTechnology. All rights reserved.
//

#import "SnowView.h"

@implementation SnowView


-(void)awakeFromNib {
    CADisplayLink *link = [CADisplayLink displayLinkWithTarget:self selector:@selector(update)];
    [link addToRunLoop:[NSRunLoop mainRunLoop] forMode:NSDefaultRunLoopMode];
}

- (void)update {
    _snowY += 3;
    if (_snowY > self.bounds.size.height) {
        _snowY = 0;
    }
    [self setNeedsDisplay];
}
static int _snowY = 0;
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
    UIImage *image = [UIImage imageNamed:@"雪花"];
    [image drawAtPoint:CGPointMake(0, _snowY)];
    
}



@end
