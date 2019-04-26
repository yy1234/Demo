//
//  ViewReusePool.h
//  ReusingCell
//
//  Created by yang on 2019/4/25.
//  Copyright © 2019 XingYeTechnology. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>
NS_ASSUME_NONNULL_BEGIN

@interface ViewReusePool : NSObject
//从重用池拿取view
- (UIView *)dequeueReusableView;

//向重用c池中加入view
- (void)addUsingView: (UIView *)view;


/**
重置方法，将当前使用中的视图移动到可重用队列当中
 */
- (void)reset;

@end

NS_ASSUME_NONNULL_END
