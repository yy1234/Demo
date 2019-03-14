//
//  Person+Category3.m
//  LoadAndInitialize
//
//  Created by yang on 2019/3/13.
//  Copyright © 2019 XingYeTechnology. All rights reserved.
//

#import "Person+Category3.h"

@implementation Person (Category3)
+(void)load
{
    NSLog(@"%s",__FUNCTION__);
}
+(void)initialize
{
    NSLog(@"%s",__FUNCTION__);
}
@end
