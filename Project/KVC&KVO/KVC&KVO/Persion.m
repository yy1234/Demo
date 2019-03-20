//
//  Persion.m
//  KVC&KVO
//
//  Created by yang on 2019/3/14.
//  Copyright © 2019 XingYeTechnology. All rights reserved.
//

#import "Persion.h"
#import "Cat.h"
@implementation Persion {
    NSString *_name;
    Cat *_cat;
}


+ (BOOL)accessInstanceVariablesDirectly {
    return YES;
}


- (id)valueForUndefinedKey:(NSString *)key {
    NSLog(@"出现异常，该key不存在%@",key);
    return nil;
}

- (void)setValue:(id)value forUndefinedKey:(NSString *)key {
    NSLog(@"出现异常，该key不存在%@", key);
}

#pragma mark get
//- (NSInteger)getAge {
//    return 10;
//}

- (NSInteger)age {
    return 10;
}


@end
