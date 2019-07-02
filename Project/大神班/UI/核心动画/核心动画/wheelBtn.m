//
//  wheelBtn.m
//  核心动画
//
//  Created by yang on 2019/5/8.
//  Copyright © 2019 XingYeTechnology. All rights reserved.
//

#import "wheelBtn.h"

@implementation wheelBtn

-(CGRect)imageRectForContentRect:(CGRect)contentRect {
    CGFloat w = 40;
    CGFloat h = 50;
    CGFloat x = (contentRect.size.width - w) * 0.5;
    CGFloat y = 20;
    return CGRectMake(x, y, w, h);
}
@end
