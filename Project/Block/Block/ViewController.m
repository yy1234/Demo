//
//  ViewController.m
//  Block
//
//  Created by yang on 2019/3/18.
//  Copyright © 2019 XingYeTechnology. All rights reserved.
//

#import "ViewController.h"
#import "Persion.h"
@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
}


- (void)touchesEnded:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
    Persion *person = [[Persion alloc] init];
  /*
   __weak Persion *waekP = person;
   dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(1 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
   NSLog(@"weakP ----- %@",waekP);
   //外部的waekP没有被释放，是因为这里面的bblock被拷贝到了堆上，person没有被释放，注释下面这段代码，waekP会被释放的
   dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(3.0 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
   NSLog(@"person ----- %@",person);
   });
   
   });
   */

    __weak Persion *waekP = person;
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(1 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
        NSLog(@"person ----- %@",person);
        //这里面的waekP肯定会被提前释放的了，上面这段代码执行以后，就不会对person进行强应用了，
        dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(1.0 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
            NSLog(@"weakP ----- %@",waekP);
        });
        
    });
    
}
@end
