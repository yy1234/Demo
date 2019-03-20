//
//  ViewController.m
//  KVC&&KVO
//
//  Created by yang on 2019/3/15.
//  Copyright © 2019 XingYeTechnology. All rights reserved.
//

#import "ViewController.h"
#import "Persion.h"
#import "Book.h"
@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    /*
     在开发过程中，一个类的成员变量有可能是自定义类或其他的复杂数据类型，你可以先用KVC获取该属性，然后再次用KVC来获取这个自定义类的属性，
     但这样是比较繁琐的，对此，KVC提供了一个解决方案，那就是键路径keyPath。顾名思义，就是按照路径寻找key。
     */
    Persion *per = [[Persion alloc] init];
    Book *cat = [[Book alloc] init];
    
    
    [per setValue:cat forKey:@"cat"];
    [per setValue:@"小苗" forKeyPath:@"cat.name"];
    
    /*
     通常情况下，KVC不允许你要在调用setValue：属性值 forKey：(或者keyPath)时对不存在的key进行操作。 不然，会报错forUndefinedKey发生崩溃，重写forUndefinedKey方法避免崩溃。
     - (id)valueForUndefinedKey:(NSString *)key
     - (void)setValue:(id)value forUndefinedKey:(NSString *)key
     
     */
    [per setValue:@10 forKeyPath:@"name11111"];

    NSLog(@"小猫的名字为===%@",[per valueForKeyPath:@"cat.name"]);
    

    
    
   /*
    KVC键值验证（Key-Value Validation）
    这样就给了我们一次纠错的机会。需要指出的是，KVC是不会自动调用键值验证方法的，就是说我们如果想要键值验证则需要手动验证。但是有些技术，比如CoreData会自动调用。
    */
    Persion *p2 = [[Persion alloc] init];
    NSNumber *age = @11;
    NSError *error;
    NSString *key = @"age";
    BOOL isValid = [p2 validateValue:&age forKey:key error:&error];
    if (isValid) {
        NSLog(@"键值匹配");
        [p2 setValue:age forKey:key];
    }else{
        NSLog(@"键值不匹配");

    }
    
    /*
     简单集合运算符
     简单集合运算符共有@avg， @count ， @max ， @min ，@sum5种，都表示什么直接看下面例子就明白了， 目前还不支持自定义。
     */
    Book *book1 = [Book new];
    book1.name = @"The Great Gastby";
    book1.price = 10;
    Book *book2 = [Book new];
    book2.name = @"Time History";
    book2.price = 20;
    Book *book3 = [Book new];
    book3.name = @"Wrong Hole";
    book3.price = 30;
    
    Book *book4 = [Book new];
    book4.name = @"Wrong Hole";
    book4.price = 40;
    
    NSArray* arrBooks = @[book1,book2,book3,book4];
    NSNumber* sum = [arrBooks valueForKeyPath:@"@sum.price"];
    NSLog(@"sum:%f",sum.floatValue);
    
    NSNumber *avg = [arrBooks valueForKeyPath:@"@avg.price"];
    NSLog(@"avg:%f",avg.floatValue);
    
    NSNumber *count = [arrBooks valueForKeyPath:@"@count"];
    NSLog(@"count:%f",count.floatValue);

    NSNumber *min = [arrBooks valueForKeyPath:@"@min.price"];
    NSLog(@"min:%f",min.floatValue);

    NSNumber* max = [arrBooks valueForKeyPath:@"@max.price"];
    NSLog(@"max:%f",max.floatValue);
    
}


@end
