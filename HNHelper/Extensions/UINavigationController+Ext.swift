//
//  UINavigationController.swift
//  HNHelper
//
//  Created by oneweek on 9/7/17.
//  Copyright © 2017 Harry Nguyen. All rights reserved.
//

import UIKit

extension UINavigationController {
    func replace(_ vc:UIViewController,toVC:AnyClass){
        let views = self.viewControllers
        var replace = [UIViewController]()
        for view in views {
            if view.className == String(describing: toVC) {
                replace.append(vc)
            }else{
                replace.append(view)
            }
        }
        self.viewControllers = replace
    }
}
