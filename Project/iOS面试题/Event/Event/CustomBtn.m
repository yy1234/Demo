//
//  CustomBtn.m
//  Event
//
//  Created by yang on 2019/4/25.
//  Copyright © 2019 XingYeTechnology. All rights reserved.
//

#import "CustomBtn.h"

@implementation CustomBtn


/**
 主窗口会在视图层次结构中找到一个最合适的视图来处理触摸事件，寻找的方法就是hitTest
 
 1.当一个事件发生以后，事件会从父控件传给子控件，也就是说UIApplication -> UIWindow -> UIView -> fit view,寻找最合适的fitView
 2.接下来就是事件响应，看fitview能否响应事件，如果不能则将事件传递给fitview的父视图，一直传递到fitview所在的父控制器，看父控制器所在的view能不能个处理这个事件，如果不能则控制器能不能响应事件，如果不能则像父控制器的根控制器处理，还不能处理则向winkow处理，再不能处理，向application处理，application处理不了，则h该事件会被丢弃
 3.子控件实现了touchesBegan，则事件由该控件来接受如果调用了 [super touches….];就会将事件顺着响应者链条往上传递，传递给上一个响应者；接着就会调用上一个响应者的 touches….方法。
 */


-(UIView *)hitTest:(CGPoint)point withEvent:(UIEvent *)event{
    //这3种情况下的话，视图是不响应操作的
    if (!self.userInteractionEnabled ||
        self.isHidden ||
        self.alpha <= 0.01) {
        return nil;
    }
    __block UIView *hit = nil;
    if ([self pointInside:point withEvent:event]) {
        //遍历当前对象的z子视图
        [self.subviews enumerateObjectsUsingBlock:^(__kindof UIView * _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
            CGPoint convertPoint = [self convertPoint:point toView:obj];
            //寻找需要响应的view
            hit = [self hitTest:convertPoint withEvent:event];
            if (hit) {
                *stop = YES;
            }
        }];
        if (hit){
            return hit;
        }else{
            return self;
        }
    }else {
        return nil;
    }
   
    
}


- (BOOL)pointInside:(CGPoint)point withEvent:(UIEvent *)event {
    CGFloat x1 = point.x;
    CGFloat y1 = point.y;

    CGFloat x2 = self.frame.size.width / 2;
    CGFloat y2 = self.frame.size.height / 2;
    //找到距离中心点的view
    double dis = sqrt((x1 - x2) * (x1 - x2) + (y1 - y2) * (y1 - y2));
    // 67.923
    if (dis <= self.frame.size.width / 2) {
        return YES;
    }
    else{
        return NO;
    }
     return YES;
}

- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
    [super touchesBegan:touches withEvent:event];
    NSLog(@"%s",__func__);
}
@end
