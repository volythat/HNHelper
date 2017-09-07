//
//  HNRouter.swift
//
//
//  Created by oneweek on 2/14/17.
//  Copyright © 2017 Harry Nguyen. All rights reserved.
//

import UIKit

enum sbName : String {
    case main = "Main"
}

extension UINavigationController{

}

extension UIViewController {
    
    func loadVC(_ clas: AnyClass,_ storyboard:sbName = sbName.main)->UIViewController{
        let storyboard = UIStoryboard(name: storyboard.rawValue, bundle: nil)
        return storyboard.instantiateViewController(withIdentifier :String(describing: clas))
    }
    
}
