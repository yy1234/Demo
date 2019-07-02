//
//  Persion.m
//  Runtime
//
//  Created by yang on 2019/5/4.
//  Copyright © 2019 XingYeTechnology. All rights reserved.
//

#import "Persion.h"
#import <objc/message.h>
@implementation Persion

-(void)eat:(NSString *)food {
    NSLog(@"人吃了%@",food);
}

+(void)run:(NSString *)location {
    NSLog(@"人在%@跑步",location);
}


id buySomething(id self,SEL _cmd,id param) {
    NSLog(@"人买了%@",param);
    return @"返回值";
}

//当调用没有这个方法的时候,会调用这个方法
+(BOOL)resolveInstanceMethod:(SEL)sel {
    if (sel == @selector(buy:)) {
        class_addMethod(self,sel, (IMP)buySomething, "@@:@");
        return YES;
    }
    
    return [super resolveClassMethod:sel];
}

@end
