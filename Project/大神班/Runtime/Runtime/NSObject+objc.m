//
//  NSObject+objc.m
//  02-Runtime(交换方法)
//
//  Created by yang on 2019/5/4.
//  Copyright © 2019 xiaomage. All rights reserved.
//

#import "NSObject+objc.h"
#import <objc/message.h>
@implementation NSObject (objc)


-(void)setName:(NSString *)name {
    objc_setAssociatedObject(self, @"name", name, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
}

-(NSString *)name {
   NSString *ss = objc_getAssociatedObject(self, @"name");
    return  ss;
}
@end
