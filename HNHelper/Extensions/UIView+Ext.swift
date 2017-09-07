//
//  UIView+Ext.swift
//  HNHelper
//
//  Created by oneweek on 9/7/17.
//  Copyright © 2017 Harry Nguyen. All rights reserved.
//

import UIKit

extension UIView {
    func toImage() -> UIImage {
        if UIScreen.main.responds(to: #selector(NSDecimalNumberBehaviors.scale)) {
            UIGraphicsBeginImageContextWithOptions(self.frame.size, false, UIScreen.main.scale);
        }else{
            UIGraphicsBeginImageContext(self.frame.size);
        }
        
        self.layer.render(in: UIGraphicsGetCurrentContext()!)
        let image = UIGraphicsGetImageFromCurrentImageContext()
        UIGraphicsEndImageContext()
        return image!
    }
}
