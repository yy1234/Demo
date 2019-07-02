//
//  ViewController.swift
//  CocoaSyncSocket
//
//  Created by yang on 2019/7/2.
//  Copyright © 2019 XingYeTechnology. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var textFidld: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()


    }

    @IBAction func connect(_ sender: Any) {
        SocketManger.share.connect()
        
    }
    
    
    @IBAction func sendMsg(_ sender: Any) {
        SocketManger.share.sendMsg(message: "哈哈")

    }
    
    @IBAction func disConnect(_ sender: Any) {
        SocketManger.share.connect()

        
    }
}

