//
//  NotificationCenter+Ext.swift
//  HNHelper
//
//  Created by oneweek on 9/7/17.
//  Copyright © 2017 Harry Nguyen. All rights reserved.
//

import UIKit

public enum NotificationName : String {
    case notificationDetail = "notificationDetail"
    
}

extension NotificationCenter {
    class func post(_ name : NotificationName,object:Any?){
        NotificationCenter.default.post(name: NSNotification.Name(name.rawValue), object: object)
    }
    
    class func add(_ name : NotificationName,observer:Any,selector: Selector) {
        NotificationCenter.default.addObserver(observer, selector: selector, name: NSNotification.Name(name.rawValue), object: nil)
    }
    class func add(_ observer:Any,selector: Selector,name:NSNotification.Name){
        NotificationCenter.default.addObserver(observer , selector: selector, name: name, object: nil)
    }
    
}

