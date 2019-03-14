//
//  ViewController.swift
//  Test
//
//  Created by yang on 2019/3/7.
//  Copyright © 2019 XingYeTechnology. All rights reserved.
//

import UIKit
typealias block = (Int,Int) -> Int
class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        let per = Person()
        per.age = "1"
        if let age = per.age, age == "1" {
            print("人员名字为1")
        }else{  
            print("人员名字为1")
        }
        
        
        
        // Do any additional setup after loading the view, typically from a nib.
        
        let sum = {(a: Int, b: Int) -> Int in
            
            return a + b
        }
        
//        print(sum(1,1))
        

        let sum2:block = {(a,b) in
            return a + b
        }
//        print(sum(2,2))
        let sss = playBack()
        print("\(sss.max) \(sss.min)")
        
  
    }
    
    func someFunction(argumentLabel parameterName: Int) {
        // In the function body, parameterName refers to the argument value
        // for that parameter.
    }

    func makeIncrementer(forIncrement amount: Int) -> () -> Int {
        var runningTotal = 0
        func incrementer() -> Int {
            runningTotal += amount
            return runningTotal
        }
        return incrementer
    }
    
    func playBack() -> (max: Int,min: Int) {
        
        return (2,1)
    }

}


class VideoMode {
    var resolution = Resolution()
    var interlaced = false
    var frameRate = 0.0
    var name: String?
}

struct Resolution {
    var width = 0
    var height = 0
}
