//
//  Extensions.swift
//  
//
//  Created by oneweek on 2/14/17.
//  Copyright © 2017 Harry Nguyen. All rights reserved.
//

import UIKit
import ImageIO


//MARK: - Macros
public var APP_VERSION : String{
get{
    return Bundle.main.infoDictionary?["CFBundleShortVersionString"] as! String
}
}

public var APP_BUILD : String{
get{
    return Bundle.main.infoDictionary?["CFBundleVersion"] as! String
}
}

public var APP_ID : String{
get{
    return Bundle.main.infoDictionary?["CFBundleIdentifier"] as! String
}
}

let appDelegate  = UIApplication.shared.delegate as! AppDelegate
let screenSize: CGRect = UIScreen.main.bounds
let uuid = UIDevice.current.identifierForVendor!.uuidString //moi lan install la 1 uuid

public var isSimulator : Bool {
get {
    #if (arch(i386) || arch(x86_64)) && os(iOS)
        return true
    #else
        return false
    #endif
}
}

//MARK: - Log
func LogD(_ message:String, function:String = #function) {
    #if !NDEBUG
        let formatter = DateFormatter()
        formatter.dateFormat = "HH:mm:ss"
        let date = formatter.string(from: Date())
        print("=================================================")
        print("\(date) Func: \(function) : \(message)")
    #endif
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











