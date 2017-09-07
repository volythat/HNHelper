//
//  UIViewController+Ext.swift
//  HNHelper
//
//  Created by oneweek on 9/7/17.
//  Copyright © 2017 Harry Nguyen. All rights reserved.
//

import UIKit

public enum sbName : String {
    case main = "Main"
}

extension UIViewController {
    
    func loadVC(_ clas: AnyClass,_ storyboard:sbName = sbName.main)->UIViewController{
        let storyboard = UIStoryboard(name: storyboard.rawValue, bundle: nil)
        return storyboard.instantiateViewController(withIdentifier :String(describing: clas))
    }
    
    func push(_ viewController: UIViewController, animated: Bool = true ){
        if let nav = self.navigationController {
            nav.pushViewController(viewController, animated: animated)
        }else{
            LogD("khong phai navigationviewcontroller")
        }
    }
    func pop(_ animated:Bool = true){
        if let nav = self.navigationController {
            nav.popViewController(animated: animated)
        }else{
            LogD("khong phai navigationviewcontroller")
        }
    }
    func present(_ viewController:UIViewController){
        self.present(viewController, animated: true, completion: nil)
    }
}
