//
//  NSObject+Ext.swift
//  HNHelper
//
//  Created by oneweek on 9/7/17.
//  Copyright © 2017 Harry Nguyen. All rights reserved.
//

import UIKit

extension NSObject {
    var className: String {
        return String(describing: type(of: self))
    }
    
    class var className: String {
        return String(describing: self)
    }
    
}
