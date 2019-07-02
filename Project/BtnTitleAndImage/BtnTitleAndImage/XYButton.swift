//
//  XYButton.swift
//  BtnTitleAndImage
//
//  Created by yang on 2019/5/15.
//  Copyright © 2019 XingYeTechnology. All rights reserved.
//

import UIKit

class XYButton: UIButton {
    var titleRect1: CGRect?
    var imageRect1: CGRect?
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.imageView?.contentMode = .center
        self.titleLabel?.textAlignment = .center
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func imageRect(forContentRect contentRect: CGRect) -> CGRect {
        guard let imageRect = self.imageRect1,!imageRect.equalTo(CGRect.zero) else {
            return super.imageRect(forContentRect: contentRect)
        }
        return imageRect
    }
    
    override func titleRect(forContentRect contentRect: CGRect) -> CGRect {
        guard let rect = self.titleRect1,!(rect.equalTo(CGRect.zero)) else {
            return super.titleRect(forContentRect: contentRect)
        }
        return rect
    }
    
}
