//
//  Person+Category1.m
//  LoadAndInitialize
//
//  Created by yang on 2019/3/13.
//  Copyright © 2019 XingYeTechnology. All rights reserved.
//

#import "Person+Category1.h"

@implementation Person (Category1)
+(void)load
{
    NSLog(@"%s",__FUNCTION__);
}
+(void)initialize
{
    NSLog(@"%s",__FUNCTION__);
}
@end
