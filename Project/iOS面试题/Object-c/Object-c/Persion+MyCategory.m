//
//  Persion+MyCategory.m
//  Object-c
//
//  Created by yang on 2019/4/28.
//  Copyright © 2019 XingYeTechnology. All rights reserved.
//

#import "Persion+MyCategory.h"
#import <objc/runtime.h>
@implementation Persion (MyCategory)
static const char* key = "ssss";

//AssociationsManger管理并存储在AssociationsHashMap中，这是一个全局对象，全局的关联 对象都在通风一个全局显示容器中
- (void)read {
    NSLog(@"调用了MyCategory的read方法");
}
- (NSString *)name {
 
    return objc_getAssociatedObject(self, key);
}

-(void)setName:(NSString *)name {
    // 第一个参数：给哪个对象添加关联
    // 第二个参数：关联的key，通过这个key获取
    // 第三个参数：关联的value
    // 第四个参数:关联的策略
    return objc_setAssociatedObject(self, key, name, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
}

@end
