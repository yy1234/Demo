//
//  Persion.h
//  Object-c
//
//  Created by yang on 2019/4/28.
//  Copyright © 2019 XingYeTechnology. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface Persion : NSObject

@end


/*
 1.什么事代理
 代理是一种设计模式
 
 2.和通知的区别
 1.通知是一对多，代理是一对一
 2.2种不同的设计模式
 
 3.代理的工作流程
 代理方（VC） 委托方（view） 协议（Delegate）

协议：包含了委托方需要的属性和方法
委托方：调用代理方遵从的协议
代理方：按照协议实现方法
 
 委托方和代理方的关系
 代理方对委托方是强引用
 */


/*
 NSNotification
 1.使用观察者模式，实现跨层消息的传递
 2.传递方式是一对多
 
 如何实现通知机制
 通过一个NSNotificationCenter单例类里面，维护一个NSNotifice_map,这个map会以通知的名字为key,value为观察者
 */
@protocol PersionDelegate <NSObject>


@end
NS_ASSUME_NONNULL_END
