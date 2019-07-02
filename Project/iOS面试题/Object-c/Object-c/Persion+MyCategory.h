//
//  Persion+MyCategory.h
//  Object-c
//
//  Created by yang on 2019/4/28.
//  Copyright © 2019 XingYeTechnology. All rights reserved.
//

#import "Persion.h"
/*
 添加关联对象
 */
NS_ASSUME_NONNULL_BEGIN

@interface Persion (MyCategory)


- (void)read;

@property (nonatomic,copy)NSString *name;
@end

NS_ASSUME_NONNULL_END
