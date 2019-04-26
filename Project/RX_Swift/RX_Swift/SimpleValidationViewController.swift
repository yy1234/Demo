//
//  SimpleValidationViewController.swift
//  RX_Swift
//
//  Created by yang on 2019/4/16.
//  Copyright © 2019 XingYeTechnology. All rights reserved.
//

import UIKit
import RxCocoa
import RxSwift
class SimpleValidationViewController: UIViewController {
    @IBOutlet weak var useName: UITextField!
    
    @IBOutlet weak var passWard: UITextField!
    @IBOutlet weak var useNameLabel: UILabel!
    
    @IBOutlet weak var passwardLabel: UILabel!
    
    @IBOutlet weak var loginBtn: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let usernameValid = useName.rx.text.orEmpty
            .map{$0.count >= 4}
            .share(replay: 1)
        
        
        
        let passWardValid  = passWard.rx.text.orEmpty.map{$0.count > 4}
        .share(replay: 1)
        
        
        let everythingValid = Observable.combineLatest(
            usernameValid,
            passWardValid
        ){ $0 && $1}
        .share(replay: 1)
        
        
        usernameValid
            .bind(to: passWard.rx.isEnabled)
            .dispose()
        
        
        usernameValid
        .bind(to: useNameLabel.rx.isHidden).dispose()
        
        passWardValid.bind(to: passwardLabel.rx.isHidden).dispose()
        
        
        everythingValid.bind(to: loginBtn.rx.isEnabled).dispose()

        loginBtn.rx.tap.subscribe(onNext: {[weak self] in self?.showAlert()}).dispose()
        
        
    }
    
    func showAlert() {
        let alertaction = UIAlertAction.init(title: "ss", style: UIAlertAction.Style.default) { (UIAlertAction) in
            print("ss");
        }
        let alertVC = UIAlertController.init(title: "弹窗", message: "弹窗", preferredStyle: UIAlertController.Style.alert)
        alertVC.addAction(alertaction)
        self .present(alertVC, animated: true, completion: nil)
    }
 
}
