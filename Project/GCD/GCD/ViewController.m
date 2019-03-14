//
//  ViewController.m
//  GCD
//
//  Created by yang on 2019/3/14.
//  Copyright © 2019 XingYeTechnology. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];

    [self dispatch_apply_2];
}

#pragma mark 串行队列
//串行队列
- (void)serialQueue {
    //通过dispatch_queue_create函数可以创建队列，第一个参数为队列的名称，第二个参数为NULL和DISPATCH_QUEUE_SERIAL返回的是串行队列
    dispatch_queue_t queue = dispatch_queue_create("serial queue", DISPATCH_QUEUE_SERIAL);
    for (NSInteger index = 0; index < 6; index++) {
        dispatch_async(queue, ^{
            NSLog(@"task index %ld in serial queue",index);
        });
    }
}

//同时开启6个线程
/*
 需要注意的是：一旦开发者新建了一个串行队列，系统一定会开启一个子线程，所以在使用串行队列的时候，一定只创建真正需要创建的串行队列，避免资源浪费。
  */
- (void)multiSerialQueue {
    for (NSInteger index = 0; index < 6; index++) {
        dispatch_queue_t queue = dispatch_queue_create("serial queue", DISPATCH_QUEUE_SERIAL);
        dispatch_async(queue, ^{
            NSLog(@"task index %ld in serial queue",index);
        });
    }
}


#pragma mark 并发队列
- (void)concurrentQueue {
    dispatch_queue_t queue = dispatch_queue_create("concurrent queue", DISPATCH_QUEUE_CONCURRENT);
    for (NSInteger index = 0; index < 6; index++) {
        dispatch_async(queue, ^{
            NSLog(@"task index %ld in concurrent queue",index);
        });
    }
}
#pragma mark 系统提供的队列
/*
 Main Dispatch Queue
 主队列：放在这个队列里的任务会追加到主线程的RunLoop中执行。需要刷新UI的时候我们可以直接获取这个队列，将任务追加到这个队列中。
 */

/*
 Globle Dispatch Queue
 全局并发队列：开发者可以不需要特意通过dispatch_queue_create方法创建一个Concurrent Dispatch Queue，可以将任务直接放在这个全局并发队列里面。
 */
- (void)globalMainqueue {
    dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0), ^{
        //加载图片
        NSData *dataFromURL = [NSData dataWithContentsOfURL:[NSURL new]];
        UIImage *imageFromData = [UIImage imageWithData:dataFromURL];
        
        dispatch_async(dispatch_get_main_queue(), ^{
            UIImageView *imageView = [[UIImageView alloc] initWithImage:imageFromData];
        });
    });
}

#pragma mark GCD的各种函数
/*
 dispatch_set_target_queue
 1.改变队列的优先级。
 2.防止多个串行队列的并发执行。
 */
/*
 1.改变队列的优先级
 dispatch_queue_create方法生成的串行队列合并发队列的优先级都是与默认优先级的Globle Dispatch Queue一致。
 */
////需求：生成一个后台的串行队列
- (void)changePriority {
    dispatch_queue_t queue = dispatch_queue_create("queue", DISPATCH_QUEUE_SERIAL);
    dispatch_queue_t bgQueue = dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0);
    dispatch_set_target_queue(queue, bgQueue);
}

/*
  2.防止多个串行队列的并发执行。
 
 */
//反例，先不用dispatch_set_target_queue，来看下多个队列的并发
- (void)set_targetConcurrentQueue {
    NSMutableArray *array = [NSMutableArray array];
    for (NSInteger index = 0; index < 5; index++) {
        dispatch_queue_t serial_queue = dispatch_queue_create("serial_queue", NULL);
        [array addObject:serial_queue];
    }
    [array enumerateObjectsUsingBlock:^(dispatch_queue_t  _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
        dispatch_async(obj, ^{
            NSLog(@"任务%ld",idx);
        });
        
    }];
}
//正例
- (void)set_targetSerialQueue {
    NSMutableArray *array = [NSMutableArray array];
    dispatch_queue_t serial_queue_target = dispatch_queue_create("queue_target", NULL);
    for (NSInteger index = 0; index < 5; index++) {
        dispatch_queue_t serial_queue = dispatch_queue_create("serial_queue", NULL);
        dispatch_set_target_queue(serial_queue, serial_queue_target);
        [array addObject:serial_queue];
    }
    [array enumerateObjectsUsingBlock:^(dispatch_queue_t  _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
        dispatch_async(obj, ^{
            NSLog(@"任务%ld",idx);
        });
        
    }];
}

/*
 dispatch_after
 dispatch_after解决的问题：某个线程里，在指定的时间后处理某个任务：
 
 */
- (void)dispatch_after {
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(3 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
        NSLog(@"三秒之后追加到队列");
    });
    
}



/**
 dispatch_group
 如果遇到这样到需求：全部处理完多个预处理任务(block_1 ~ 4)后执行某个任务（block_finish），我们有两个方法：
 1.如果预处理任务需要一个接一个的执行：将所有需要先处理完的任务追加到Serial Dispatch Queue中，并在最后追加最后处理的任务(block_finish)。
 2.如果预处理任务需要并发执行：需要使用dispatch_group函数，将这些预处理的block追加到global dispatch queue中。
 */

/*
 1.预处理任务需要一个接一个的执行：
 这个需求的实现方式相对简单一点，只要将所有的任务（block_1 ~ 4 + block_finish）放在一个串行队列中即可，因为都是按照顺序执行的，只要不做多余的事情，这些任务就会乖乖地按顺序执行。
 */
/*
 2.预处理任务需要一个接一个的执行：

 */
- (void)dispatch_groupSerialQueue {
    dispatch_group_t group = dispatch_group_create();
    dispatch_queue_t queue = dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0);
    for (NSInteger index = 0; index < 5; index++) {
        dispatch_group_async(group, queue, ^{
          NSLog(@"任务%ld",index);
        });
    }
    
    dispatch_group_notify(group, queue, ^{
        NSLog(@"最后的任务");
    });
}

/*
 dispatch_group_wait
 dispatch_group_wait 也是配合dispatch_group 使用的，利用这个函数，我们可以设定group内部所有任务执行完成的超时时间。
 一共有两种情况：超时的情况和没有超时的情况：
 */

//超时情况

//超时    long result = dispatch_group_wait(group, time);这个是相当于在经过time这个时间后，group会去判断group的任务有没有完成，没有完成的话，判定超时。

- (void)dispatch_wait_2
{
    dispatch_group_t group = dispatch_group_create();
    dispatch_queue_t queue = dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0);
    for (NSInteger index = 0; index < 5; index ++) {
        dispatch_group_async(group, queue, ^{
            for (NSInteger i = 0; i< 1000000000; i ++) {
                
            }
            NSLog(@"任务%ld",index);
        });
    }
    
    dispatch_time_t time = dispatch_time(DISPATCH_TIME_NOW, 1ull * NSEC_PER_SEC);
    long result = dispatch_group_wait(group, time);
    if (result == 0) {
        NSLog(@"group内部的任务全部结束");
    }else{
        NSLog(@"虽然过了超时时间，group还有任务没有完成");
    }
    
}

//超时时间为：DISPATCH_TIME_NOW：无超时时间
- (void)dispatch_wait_1 {
    dispatch_group_t group = dispatch_group_create();
    dispatch_queue_t queue = dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0);
    for (NSInteger index = 0; index < 5; index++) {
        dispatch_group_async(group, queue, ^{
            for (NSInteger i = 0; i < 1000000000; i++) {
                
            }
            NSLog(@"任务%ld",index);
        });
    }
    
    long result = dispatch_group_wait(group, DISPATCH_TIME_NOW);
    if (result == 0) {
        NSLog(@"group内部的任务全部结束");
    }else{
        NSLog(@"虽然过了超时时间，group还有任务没有完成");
    }
    
}

/*
 dispatch_barrier_async
 1.读取处理追加到concurrent dispatch queue中
 2.写入处理在任何一个读取处理没有执行的状态下，追加到serial dispatch queue中（也就是说，在写入处理结束之前，读取处理不可执行）。
 
 为了帮助大家理解，我构思了一个例子：
 
 1.3名董事和总裁开会，在每个人都查看完合同之后，由总裁签字。
 2.总裁签字之后，所有人再审核一次合同。
 
 这个需求有三个关键点：
 关键点1：所有与会人员查看和审核合同，是同时进行的，无序的行为。
 关键点2：只有与会人员都查看了合同之后，总裁才能签字。
 关键点3: 只有总裁签字之后，才能进行审核。
 */
- (void)dispatch_barrier {
    dispatch_queue_t meetingQueue = dispatch_queue_create("com.meeting.queue", DISPATCH_QUEUE_CONCURRENT);
    dispatch_async(meetingQueue, ^{
        NSLog(@"总裁查看合同");
    });
    dispatch_async(meetingQueue, ^{
        NSLog(@"董事1查看合同");
    });
    
    dispatch_async(meetingQueue, ^{
        NSLog(@"董事2查看合同");
    });
    
    dispatch_async(meetingQueue, ^{
        NSLog(@"董事3查看合同");
    });
    
    dispatch_barrier_async(meetingQueue, ^{
        NSLog(@"总裁签字");

    });
    
    dispatch_async(meetingQueue, ^{
        NSLog(@"总裁审核合同");
    });
    
    dispatch_async(meetingQueue, ^{
        NSLog(@"董事1审核合同");
    });
    
    dispatch_async(meetingQueue, ^{
        NSLog(@"董事2审核合同");
    });
    
    dispatch_async(meetingQueue, ^{
        NSLog(@"董事3审核合同");
    });
    
    
}
/*
 dispatch_sync
 
 1.dispatch_async：异步函数，这个函数会立即返回，不做任何等待，它所指定的block“非同步地”追加到指定的队列中。
 2.dispatch_sync：同步函数，这个函数不会立即返回，它会一直等待追加到特定队列中的制定block完成工作后才返回，所以它的目的（也是效果）是阻塞当前线程。
 
 */

- (void)dispatch_sync_1 {
    //同步处理
    NSLog(@"%@",[NSThread currentThread]);
    NSLog(@"同步处理开始");
    __block NSInteger num = 0;
    dispatch_queue_t queue = dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0);
    dispatch_sync(queue, ^{
        //模仿耗时操作
        for (NSInteger i = 0; i< 1000000000; i ++) {
            num++;
        }
        NSLog(@"%@",[NSThread currentThread]);
        NSLog(@"同步处理完毕");
    });
    NSLog(@"%ld",num);
    NSLog(@"%@",[NSThread currentThread]);
    
}

- (void)dispatch_sync_2
{
    //异步处理
    NSLog(@"%@",[NSThread currentThread]);
    NSLog(@"异步处理开始");
    
    __block NSInteger num = 0;
    dispatch_queue_t queue = dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0);
    dispatch_async(queue, ^{
        //模仿耗时操作
        for (NSInteger i = 0; i< 1000000000; i ++) {
            num++;
        }
        NSLog(@"%@",[NSThread currentThread]);
        NSLog(@"异步处理完毕");
    });
    NSLog(@"%ld",num);
    NSLog(@"%@",[NSThread currentThread]);
}


/**
 只能输出任务1，并形成死锁。 因为任务2被追加到了主队列的最后，所以它需要等待任务3执行完成。 但又因为是同步函数，任务3也在等待任务2执行完成。 二者互相等待，所以形成了死锁。
 */
- (void)dispatch_sync_3
{
    NSLog(@"任务1");
    dispatch_queue_t queue = dispatch_get_main_queue();
    dispatch_sync(queue, ^{
        
        NSLog(@"任务2");
    });
    
    NSLog(@"任务3");
}

/*
 dispatch_apply
 通过dispatch_apply函数，我们可以按照指定的次数将block追加到指定的队列中。并等待全部处理执行结束。
 
 */

- (void)dispatch_apply_1 {
    dispatch_queue_t queue = dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0);
    dispatch_apply(10, queue, ^(size_t index) {
        NSLog(@"%ld",index);
        NSLog(@"%@",[NSThread currentThread]);
    });
    
}

- (void)dispatch_apply_2
{
    NSArray *array = @[@1,@10,@43,@13,@33];
    dispatch_queue_t queue = dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0);
    dispatch_apply([array count], queue, ^(size_t index) {
        NSLog(@"%@",array[index]);
    });
    NSLog(@"完毕");
}


/**
 通过dispatch_once处理的代码只执行一次，而且是线程安全的：
  */
- (void)dispatch_once_1
{
    dispatch_queue_t queue = dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0);
    for (NSInteger index = 0; index < 5; index++) {
        
        dispatch_async(queue, ^{
            [self onceCode];
        });
    }
}

- (void)onceCode
{
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        NSLog(@"只执行一次的代码");
    });
   
}



@end
