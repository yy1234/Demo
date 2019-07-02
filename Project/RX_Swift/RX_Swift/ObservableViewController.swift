//
//  ObservableViewController.swift
//  RX_Swift
//
//  Created by yang on 2019/5/17.
//  Copyright © 2019 XingYeTechnology. All rights reserved.
//

import UIKit
import RxCocoa
import RxSwift
class ObservableViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        //这里的map和filter是异步执行的，只有当有人订阅才会执行,这个叫做Cold Observable，会自动执行的叫做Hot Observable
       /*
         Observable会对数据进行封装，map和filter是对操作的Observable的Operator
         */
        let numArr = Observable.from(["1", "2", "3", "4", "5", "6", "7", "8", "9"])
            .map{Int($0)}.filter{
                if let item = $0,item%2 == 0  {
//                    print(item)
                    return true
                }
                return false
        }
        
        /*
         subscribe也是一个Operator，是Observable和Observer的关联着，Observer和Observable之间有着下面的关联
            1.当Observable正常发送事件的时候，会调用Observer的onNext方法
            2.当Observable成功结束时，会调用Observer提供的onCompleted方法；因此，在最后一次调用onNext之后，就会调用onCompleted；
         3.当Observable发生错误时，就会调用Observer提供的onError方法，并且，一旦发生错误，就不会再继续发送其它事件了。对于调用onComplete和onNext的过程，习惯上叫做notifications；

         */
//      _ =  numArr.subscribe { (event) in
//            print(event)
//        }
        
        _ = numArr.skip(2).subscribe({ (event) in
            print(event)
            
            
            
//            let numArr2 = Observable.from(["1", "2", "3", "4", "5", "6", "7", "8", "9"])

            _ = Observable<Int>.interval(1, scheduler: MainScheduler.instance)
                .subscribe(onNext: { print("Subscribed: \($0)") })
        
        })
        
        
        let disposable = Observable<Int>.interval(1, scheduler: MainScheduler.instance)
            .subscribe(
                onNext: { print("Subscribed: \($0)") },
                onDisposed: { print("The queue was disposed.") })
//        delay(_delay: 5) {
//            disposable.dispose()
//        }
    }
    

   
    
    
    
    func delay(_delay: Double,closure:@escaping (() ->Void)) {
        DispatchQueue.main.asyncAfter(deadline: .now() + _delay) {
            closure()
        }
    }

    
    
    

}
