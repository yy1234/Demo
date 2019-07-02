//
//  ImageSelectViewController.swift
//  RX_Swift
//
//  Created by yang on 2019/4/17.
//  Copyright © 2019 XingYeTechnology. All rights reserved.
//

import UIKit
import RxSwift
enum CustomError:Error {
    case somethingWrong
}
class ImageSelectViewController: UIViewController {
    @IBOutlet weak var cameraBtn: UIButton!
    
    @IBOutlet weak var imageView: UIImageView!
    override func viewDidLoad() {
        super.viewDidLoad()

        let strArr = ["1", "2", "3", "4", "5", "6", "7", "8", "9"]
        let arr = strArr.filter { (item) in
            Int(item)!%2 == 0
            }.compactMap{Int($0)}
        print(arr)
        return
//        Observable.of("1","2","3","4","5","6","7","8","9","10")
        
        var evenNumberObservable = Observable.from(["1", "2", "3", "4", "5", "6", "7", "8", "9"])
            .map {Int($0)}
            .filter {
                if let item = $0,item % 2 == 0 {
                   print("Even: \(item)")
                    return true;
                }else {
                    return false;
                }
            }


    
        
        
        let customOb = Observable<Int>.create { observable in
            observable.onNext(10)
            observable.onNext(11)
            observable.onError(CustomError.somethingWrong)
            observable.onCompleted()
            return Disposables.create()
        }
        
        let disposeBag = DisposeBag()
        customOb.subscribe(
            onNext: { print($0) },
            onError: { print($0) },
            onCompleted: {print("Completed") },
            onDisposed: {print("Game over")}).disposed(by: disposeBag)
        
  
        /// MARK---PublishSubject
        let subject = PublishSubject<String>()
        let sub1 = subject.subscribe {
            print("Sub1 - what happened: \($0)")
        }
        
         subject.onNext("Episode1 updated")
    
        //要想接受 subject.onNext("Episode1 updated")只能在这行代码之前接收

        let sub2 = subject.subscribe {
            print("Sub1 - what happened: \($0)")
        }
        sub1.dispose()
        
        
        subject.onNext("Episode2 updated")
        subject.onNext("Episode3 updated")
        sub2.dispose()
        
        
        
          /// MARK---BehaviorSubject
        let beSubject = BehaviorSubject<String>(value: "RxSwift step by step")
        
      
        let beSub1 = beSubject.subscribe(onNext: {
            print("beSub1 - what happened: \($0)")

        })
        beSubject.onNext("Episode1 updated")
        
        let beSub2 = subject.subscribe(onNext: {
            print("beSub2 - what happened: \($0)")
        })

        
        /// MARK---BehaviorSubject

       
        
    }
    
    
    
//    let sub1 = subject.subscribe(onNext: {
//        print("Sub1 - what happened: \($0)")
//    })
    
    
    
    

   

}
