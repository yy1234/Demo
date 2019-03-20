//
//  Persion.m
//  KVC&&KVO
//
//  Created by yang on 2019/3/15.
//  Copyright © 2019 XingYeTechnology. All rights reserved.
//

#import "Persion.h"
#import "Book.h"
@interface Persion()

@property (nonatomic,assign)NSInteger age;
@end
@implementation Persion {
    Book *_cat;
}
/*
 重写下面2个方法可以避免程序奔溃
 */
- (id)valueForUndefinedKey:(NSString *)key {
    NSLog(@"出现异常，该key不存在%@",key);
    return nil;
}

- (void)setValue:(id)value forUndefinedKey:(NSString *)key {
    NSLog(@"出现异常，该key不存在%@", key);
}

- (BOOL)validateValue:(inout id  _Nullable __autoreleasing *)ioValue forKey:(NSString *)inKey error:(out NSError * _Nullable __autoreleasing *)outError {
    NSNumber *age = *ioValue;
    if (age.integerValue == 10) {
        return NO;
    }
    
    return YES;
}


@end
