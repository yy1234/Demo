//
//  Person.m
//  LoadAndInitialize
//
//  Created by yang on 2019/3/13.
//  Copyright © 2019 XingYeTechnology. All rights reserved.
//

#import "Person.h"

@implementation Person

+(void)load
{
    NSLog(@"%s",__FUNCTION__);
}

+(void)initialize
{
//    if (self == [Person class]) {
//        NSLog(@"%s",__FUNCTION__);
//    }
    NSLog(@"%s",__FUNCTION__);
    
}
@end
