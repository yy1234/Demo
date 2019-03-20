//
//  main.m
//  Block
//
//  Created by yang on 2019/3/18.
//  Copyright © 2019 XingYeTechnology. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "AppDelegate.h"
#import "Persion.h"
typedef void (^Block)();
struct __mian_block_desc0 {
    size_t reserved;
    size_t Block_size;
};

struct __block_impl {
    void *isa;
    int Flags;
    int Reserved;
    void *funcPtr;
};


struct __main_block_impl_0 {
    struct __block_impl impl;
    struct __mian_block_desc0 *Desc;
    int age;

};
int main(int argc, char * argv[]) {
    @autoreleasepool {
        //
//        int age = 10;
//        static int b11 = 5;
//        void(^block)(int , int) = ^(int a, int b){
//            NSLog(@"this is block,a = %d,b = %d",a,b);
//            NSLog(@"this is block,age = %d",age);
//            NSLog(@"=======%ld",b11);
//        };
//        age  = 10;
//         对block的类型进行强行转换，验证block内部的机制对不对
//        struct  __main_block_impl_0 *blockStruct  = (__bridge struct __main_block_impl_0 *)block;
//        b11 = 2;
//        block(3,5);

//        Block block;
//        {
//            Persion *persion = [[Persion alloc] init];
//            persion.age = 10;
//            block = ^{
//                NSLog(@"====block内部%f",persion.age);
//            };
//        }
        //离开了作用域以后，persion还是不会被释放，因为block对person进行了引用
        
//        // block内没有访问auto变量
//        Block block = ^{
//            NSLog(@"block---------");
//        };
//        NSLog(@"%@",[block class]);
//        int a = 10;
//        // block内访问了auto变量，但没有赋值给__strong指针
//        NSLog(@"%@",[^{
//            NSLog(@"block1---------%d", a);
//        } class]);
//        // block赋值给__strong指针
//        Block block2 = ^{
//            NSLog(@"block2---------%d", a);
//        };
//        NSLog(@"%@",[block2 class]);
        
      
       return UIApplicationMain(argc, argv, nil, NSStringFromClass([AppDelegate class]));
    }
}

//也就是说栈空间上的block不会对对象强引用，堆空间的block有能力持有外部调用的对象，即对对象进行强引用或去除强引用的操作。


