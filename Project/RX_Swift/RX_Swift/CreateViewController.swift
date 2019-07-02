//
//  CreateViewController.swift
//  RX_Swift
//
//  Created by yang on 2019/5/17.
//  Copyright © 2019 XingYeTechnology. All rights reserved.
//

import UIKit
import RxCocoa
import RxSwift
class CreateViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        /*
         自定义Observable
        */
        let customOb = Observable<Int>.create { (observer) -> Disposable in
            observer.onNext(11)
            observer.onError(CustomError.somethingWrong)
            observer.onNext(10)
            observer.onCompleted()
            return Disposables.create()
        }
        
        customOb.subscribe(
            onNext: { print($0) },
            onError: { print($0)},
            onCompleted: { print("Completed") },
            onDisposed: { print("Game over") }
            ).dispose()
        
    }
    

 
}
