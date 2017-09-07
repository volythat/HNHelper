//
//  HNAlert.swift
//
//
//  Created by oneweek on 7/4/17.
//  Copyright © 2017 Harry Nguyen. All rights reserved.
//

import UIKit

extension UIViewController {
    func showAlert(title:String,message:String){
        HNAlert.alert(self , title: title , message: message)
    }
    func showConfirm(title:String = "Confirm",message:String = "Are you sure?",ok: @escaping ((UIAlertAction) -> Swift.Void)){
        HNAlert.confirm(self , title: title , message: message) { (action) in
            ok(action)
        }
    }
}


struct AlertButton {
    var title : String = ""
    var style : UIAlertActionStyle = .default
    
    init(_ title:String,style:UIAlertActionStyle = .default) {
        self.title = title
        self.style = style
    }
}

class HNAlert: NSObject {
    
    class func alert(title:String,message:String){
        if let delegate = UIApplication.shared.delegate as? AppDelegate {
            if let vc = delegate.window?.rootViewController {
                self.alert(vc , title: title, message: message)
            }
        }
    }
    
    //MARK: - Default
    class func alert(_ controller:UIViewController,title:String,message:String,handler: ((UIAlertAction) -> Swift.Void)? = nil){
        let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "OK", style: .default, handler: handler))
        controller.present(alert , animated: true , completion: nil)
    }
    
    class func confirm(_ controller:UIViewController,title:String,message:String,ok: ((UIAlertAction) -> Swift.Void)? = nil){
        let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "OK", style: .default, handler: ok))
        alert.addAction(UIAlertAction(title: "Cancel", style: .cancel, handler: nil))
        controller.present(alert , animated: true , completion: nil)
    }
    
    
    class func alert(_ controller:UIViewController,title:String,message:String,buttons:[String],handler: ((UIAlertAction) -> Swift.Void)? = nil){
        let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
        
        for button in buttons {
            alert.addAction(UIAlertAction(title: button, style: .default, handler: handler))
        }
        
        controller.present(alert , animated: true , completion: nil)
    }
    
    class func alertWithStyleButton(_ controller:UIViewController,title:String,message:String,buttons:[AlertButton],style:UIAlertControllerStyle = .alert,sender:Any? = nil,handler: ((UIAlertAction) -> Swift.Void)? = nil){
        let alert = UIAlertController(title: title, message: message, preferredStyle: sender == nil ? .alert : style)
        
        for button in buttons {
            alert.addAction(UIAlertAction(title: button.title, style: button.style, handler: handler))
        }
        if style == .actionSheet {
            if let popoverController = alert.popoverPresentationController {
                if let view = sender as? UIView {
                    popoverController.sourceView = view
                    popoverController.sourceRect = view.bounds
                }else {
                    popoverController.sourceView = controller.view
                    popoverController.sourceRect = CGRect(x: controller.view.center.x, y: controller.view.center.y, width: 1, height: 1)
                }
            }
        }
        
        controller.present(alert , animated: true , completion: nil)
    }
    
}
