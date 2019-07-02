//
//  ViewController.swift
//  BtnTitleAndImage
//
//  Created by yang on 2019/5/15.
//  Copyright © 2019 XingYeTechnology. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        let btn = XYButton.init(type: .custom)
        btn.frame = CGRect.init(x: 90, y: 90, width: 100, height: 100)
        btn.backgroundColor = UIColor.orange;
        view.addSubview(btn)
        btn.setImage(UIImage.init(named: "message"), for: .normal)
        btn.setImage(UIImage.init(named: "message"), for: .selected)
//        btn.imageEdgeInsets = UIEdgeInsets.init(top: 0, left: 200, bottom: 0, right: 0)
        btn.setTitle("预警管理", for: .normal)
        btn.titleLabel?.font = UIFont.systemFont(ofSize: 14.0)
        btn.imageRect1 = CGRect.init(x: 0, y: 0, width: 100, height: 60)
        btn.titleRect1 = CGRect.init(x: 0, y: 60, width: 100, height: 40)
        btn.imageView?.contentMode = .scaleAspectFit
        
        btn.imageView?.backgroundColor = UIColor.red
        btn.titleLabel?.backgroundColor = UIColor.purple
        
       
//        btn.titleEdgeInsets = UIEdgeInsets.init(top: 60, left: 0, bottom: 0, right: 0)
    }


}

