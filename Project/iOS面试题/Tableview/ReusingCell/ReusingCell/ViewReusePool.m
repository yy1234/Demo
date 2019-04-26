//
//  ViewReusePool.m
//  ReusingCell
//
//  Created by yang on 2019/4/25.
//  Copyright © 2019 XingYeTechnology. All rights reserved.
//

#import "ViewReusePool.h"
@interface ViewReusePool()
/**
 等待使用的队列
 */
@property (nonatomic,strong)NSMutableSet *waitUsedQueue;
/**
 使用中的队列
 */
@property (nonatomic,strong)NSMutableSet *usingQueue;

@end


@implementation ViewReusePool


- (UIView *)dequeueReusableView {
    UIView *view = [_waitUsedQueue anyObject];
    if (view == nil) {
        return nil;
    }else {
        [_waitUsedQueue removeObject:view];
        [_usingQueue addObject:view];
    }
    return view;
}



-(NSMutableSet *)waitUsedQueue{
    if (!_waitUsedQueue) {
        _waitUsedQueue = [[NSMutableSet alloc] init];
    }
    return _waitUsedQueue;
}

-(NSMutableSet *)usingQueue{
    if (!_usingQueue) {
        _usingQueue = [[NSMutableSet alloc] init];
    }
    return _usingQueue;
}
@end
