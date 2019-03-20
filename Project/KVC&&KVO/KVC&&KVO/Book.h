//
//  Cat.h
//  KVC&&KVO
//
//  Created by yang on 2019/3/15.
//  Copyright © 2019 XingYeTechnology. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>
NS_ASSUME_NONNULL_BEGIN

@interface Book : NSObject

@property (nonatomic, assign)CGFloat price;
@property (nonatomic, copy)NSString* name;

@end

NS_ASSUME_NONNULL_END
