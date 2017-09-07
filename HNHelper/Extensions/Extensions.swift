//
//  Extensions.swift
//  
//
//  Created by oneweek on 2/14/17.
//  Copyright © 2017 Harry Nguyen. All rights reserved.
//

import UIKit


//MARK: - Macros


public var isSimulator : Bool {
get {
    #if (arch(i386) || arch(x86_64)) && os(iOS)
        return true
    #else
        return false
    #endif
}
}


//MARK: - Add Dictionary
func += <K, V> (left: inout [K:V], right: [K:V]) {
    for (k, v) in right {
        left.updateValue(v, forKey: k)
    }
}


//MARK: - Orther
func hideKeyboard() -> Void {
    UIApplication.shared.keyWindow?.endEditing(true)
}











