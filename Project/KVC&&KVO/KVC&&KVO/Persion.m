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
- (instancetype)init
{
    self = [super init];
    if (self) {
        _name = @"1";
    }
    return self;
}


- (void)setName:(NSString *)name {
    _name = name;

}

-(void)increase {
    [self willChangeValueForKey:@"name"];
    _name = @"3";
    [self didChangeValueForKey:@"name"];
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
