//
//  SubjectViewController.swift
//  RX_Swift
//
//  Created by yang on 2019/5/17.
//  Copyright © 2019 XingYeTechnology. All rights reserved.
//

import UIKit
import RxCocoa
import RxSwift
class SubjectViewController: UIViewController {

    /*
     都需要在运行时动态给Observable添加内容。这也就意味着，这种Observable要有双重身份：一方面，它自身得是一个订阅者以获得系统事件的通知；另一方面，它也得是一个Observable，供我们编写的客户端代码进行订阅。在Rx的世界里，这样具有双重身份的对象，有一个专属的名字，叫做Subject。因此，在用更真实的方式学习RxSwift之前，我们还需要额外做些工作。
     */
    override func viewDidLoad() {
        super.viewDidLoad()

       //publishSubject()
        
//        behaviorSubject()
//        replaySubject()
        variable()
    }
    

    func publishSubject() {
        /*
         1.PublishSubject
         这个是会员机制，只有先订阅，才能订阅到消息
         */
        let subject = PublishSubject<String>()
        
        let sub1 = subject.subscribe(onNext :{
            print("Sub1 - what happened: \($0)")
        })
        subject.onNext("Episode1 updated")
        
        //dispose之后就不会再接受消息了
        sub1.dispose()
        
        let sub2 = subject.subscribe(onNext :{
            print("Sub2 - what happened: \($0)")
            
        })
        
        subject.onNext("Episode2 updated")
        subject.onNext("Episode3 updated")
        sub2.dispose()
        
        
        
    }
    
    
    //相对于上面的PublishSubject，BehaviorSubject只能订阅到最新的消息
    func behaviorSubject()  {
        let subject = BehaviorSubject<String>(
            value: "RxSwift step by step")
        
        let sub1 = subject.subscribe(onNext: {
            print("Sub1 - what happened: \($0)")
        })
       
       
        subject.onNext("Episode1 updated")
        subject.onNext("Episode2 updated")
        //可以在后面订阅了，但是只能订阅到后面的消息了
        let sub2 = subject.subscribe(onNext: {
            print("Sub2 - what happened: \($0)")
        })
       
    }
    
    
    func replaySubject() {
        let subject = ReplaySubject<String>.create(bufferSize: 2)
        let sub1 = subject.subscribe(onNext: {
            print("Sub1 - what happened: \($0)")
        })
        
        subject.onNext("Episode1 updated")
        subject.onNext("Episode2 updated")
        subject.onNext("Episode3 updated")
        subject.onNext("Episode4 updated")

        //后面之后订阅到最后2个消息
        let sub2 = subject.subscribe(onNext: {
            print("Sub2 - what happened: \($0)")
        })
        let sub3 = subject.subscribe(onNext: {
            print("Sub3 - what happened: \($0)")
        })
    }
    
    /*
     1.Variable
     需要某个值是有“响应式”特性的，例如可以通过设置这个值来动态控制按钮是否禁用，是否显示某些内容等
     */
    func variable() {
        let stringVariable = Variable("Episode1")
        let sub1 = stringVariable
            .asObservable()
            .subscribe {
                print("sub1: \($0)")
        }
        
//        stringVariable.value = "Episode2"

    }

}
