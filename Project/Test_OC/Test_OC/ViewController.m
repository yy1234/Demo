//
//  ViewController.m
//  Test_OC
//
//  Created by yang on 2019/3/8.
//  Copyright © 2019 XingYeTechnology. All rights reserved.
//

#import "ViewController.h"
#import "MyThread.h"
typedef  int(^AddOneBlock)(int count);
@interface ViewController ()
@property (nonatomic,strong)MyThread *subThread;
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    MyThread *tmpThread = [[MyThread alloc] initWithTarget:self selector:@selector(subThreadTodo) object:nil];
    //subThread用weak声明，用weak声明，用weak声明
    self.subThread = tmpThread;
    self.subThread.name = @"subThread";
    [self.subThread start];

    
}


//子线程执行的内容
- (void)subThreadTodo
{
    NSLog(@"%@----开始执行子线程任务",[NSThread currentThread]);
    
    NSRunLoop *runLoop = [NSRunLoop currentRunLoop];
    [runLoop addPort:[NSMachPort port] forMode:NSDefaultRunLoopMode];
    
    [runLoop runMode:NSDefaultRunLoopMode beforeDate:[NSDate distantFuture]];
    NSLog(@"%@----执行子线程任务结束",[NSThread currentThread]);
}


//我们希望放在子线程中执行的任务
- (void)wantTodo{
    //断点2
    NSLog(@"当前线程:%@执行任务处理数据", [NSThread currentThread]);
    
}
//屏幕点击事件
- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event{
    //断点1
    //在子线程中去响应wantTodo方法
    [self performSelector:@selector(wantTodo) onThread:self.subThread withObject:nil waitUntilDone:NO];
}

@end
