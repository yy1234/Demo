//
//  ViewController.m
//  Copy
//
//  Created by yang on 2019/4/30.
//  Copyright © 2019 XingYeTechnology. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()
//@property (nonatomic)

/**
 这个文章是说明atomic和nonatomic之间的关系
 https://www.jianshu.com/p/b058e5ea2cad
 */


/**
 assin和weak的区别
 assin可以修饰对象也可以修饰基本的数据类型
 assin被释放时，指针还是指向原来的内存地址，weak则被至为空’
 */
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
//    CopyView *view = [[CopyView alloc] init];
    //考察的知识点看工程中的图片
    /*
     自定义对象实现拷贝的话，要实现NSCopying,NSMutableCopying>
     - (id)mutableCopyWithZone:(NSZone *)zone
     或者
     - (id)copyWithZone:(NSZone *)zone
     

     */
    

    NSMutableArray *arr = [[NSMutableArray alloc] initWithArray:@[@"1",@"2",@"3"]];
    NSLog(@"%@",arr);
    NSMutableArray *mucopy = [arr  mutableCopy];
    [mucopy addObject:@"4"];
    NSLog(@"%@",mucopy);
}


@end
