//
//  Cat.m
//  KVC&&KVO
//
//  Created by yang on 2019/3/15.
//  Copyright © 2019 XingYeTechnology. All rights reserved.
//

#import "Book.h"
#import "Persion.h"
@implementation Book {
    NSString *_name;
    
}


-(void)observeValueForKeyPath:(NSString *)keyPath ofObject:(id)object change:(NSDictionary<NSKeyValueChangeKey,id> *)change context:(void *)context{
    if ([object isKindOfClass:[Persion class]] && [keyPath isEqualToString:@"name"]) {
        NSLog(@"tttt%@",[object class]);
        Persion *p = (Persion*)object;
        NSLog(@"name==%@",p.name);
        
    }
}
@end
