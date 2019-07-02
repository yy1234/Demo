//
//  ViewController.h
//  Object-c
//
//  Created by yang on 2019/4/28.
//  Copyright © 2019 XingYeTechnology. All rights reserved.
//

#import <UIKit/UIKit.h>
/*
 分类的特点：
 1.运行时决议
 2.可以为系统类添加分类
 
 
 分类中可以添加哪些方法
 1.添加实例方法
 2.添加类方法
 3.添加协议
 4.添加属性：只是声明了实例变量，不是添加了实例变量
 */

/*
 Extension与Category区别
 
 Extension
 在编译器决议，是类的一部分，在编译器和头文件的@interface和实现文件里的@implement一起形成了一个完整的类。
 伴随着类的产生而产生，也随着类的消失而消失。
 Extension一般用来隐藏类的私有消息，你必须有一个类的源码才能添加一个类的Extension，所以对于系统一些类，如NSString，就无法添加类扩展
 Category
 是运行期决议的
 类扩展可以添加实例变量，分类不能添加实例变量
 原因：因为在运行期，对象的内存布局已经确定，如果添加实例变量会破坏类的内部布局，这对编译性语言是灾难性的。
 */


/**
 关于分类不能添加自己的属性但是可以添加方法关于自己的理解：
 
 struct objc_ivar_list *ivars            OBJC2_UNAVAILABLE;  // 该类的成员变量链表
 struct objc_method_list **methodLists   OBJC2_UNAVAILABLE;  // 方法定义的链表
 
 ivars：objc_class结构体大小是固定的，不可能往这个结构体中添加数据，只能修改。所以ivars指向的是一个固定区域，只能修改成员变量值，不能增加成员变量个数。
 
 methodList是一个二维数组，所以可以修改*methodLists的值来增加成员方法，虽没办法扩展methodLists指向的内存区域，却可以改变这个内存区域的值（存储的是指针）。
 方法改变的是空间，methodList改变的是内存地址
 
 
 分类中可以添加属性，但是不能合成set和get方法。添加成员变量的话会直接报错
 

 */



/*
 分类和扩展的区别
 1.分类是运行时决议，扩展是编译时决议
 2.扩展是致以声明的s形式存在，一般存在.m文件中
 3.不能为系统类添加扩展
 */




@interface ViewController : UIViewController

@end

