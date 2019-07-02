//
//  ViewController.swift
//  删除小尺寸图片
//
//  Created by yang on 2019/6/25.
//  Copyright © 2019 XingYeTechnology. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        let path = Bundle.main.resourcePath
        let fimanger = FileManager.default
        let file = fimanger.enumerator(atPath: path!)
        for item  in (file?.allObjects as! [String])  {
            if item.contains("thumb"){
                let filePaht = path! + "/\(item)"
               try! fimanger.removeItem(atPath: filePaht)
            
                print(filePaht)

            }

        }
    }
}

