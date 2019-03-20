//
//  ViewController.m
//  KVC&KVO
//
//  Created by yang on 2019/3/14.
//  Copyright © 2019 XingYeTechnology. All rights reserved.
//

#import "ViewController.h"
//#import "Persion.h"
//#import "Cat.h"
@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    //如果没有找到Set<Key>方法的话，会按照_key，_iskey，key，iskey的顺序搜索成员并进行赋值操作。
//    Persion *obj = [[Persion alloc] init];
//    [obj setValue:@"xiaoming" forKey:@"name"];
//
//
//    NSLog(@"obj的名字是%@", [obj valueForKey:@"name"]);
//    NSLog(@"obj的年龄是%@", [obj valueForKey:@"age"]);

    
    /*
     KVC使用keyPath
     在开发过程中，一个类的成员变量有可能是自定义类或其他的复杂数据类型，你可以先用KVC获取该属性，然后再次用KVC来获取这个自定义类的属性，
     但这样是比较繁琐的，对此，KVC提供了一个解决方案，那就是键路径keyPath。顾名思义，就是按照路径寻找key。
     */
//    Cat *cat = [[Cat alloc] init];
//    [obj setValue:cat forKey:@"cat"];
//    [obj setValue:@"小猫" forKeyPath:@"cat.name"];
//    NSLog(@"obj的\"cat的name\"是%@", [obj valueForKeyPath:@"cat.name"]);

//    NSLog(@"obj的\"cat的name\"是%@", obj);

    
}


@end
