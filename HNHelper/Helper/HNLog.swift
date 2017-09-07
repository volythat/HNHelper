//
//  HNLog.swift
//  HNHelper
//
//  Created by oneweek on 9/7/17.
//  Copyright © 2017 Harry Nguyen. All rights reserved.
//

import UIKit


func LogD(_ message:String, function:String = #function) {
    #if !NDEBUG
        let formatter = DateFormatter()
        formatter.dateFormat = "HH:mm:ss"
        let date = formatter.string(from: Date())
        print("=================================================")
        print("\(date) Func: \(function) : \(message)")
    #endif
}

func Log(_ object:Any, function:String = #function){
    #if !NDEBUG
        if let str = object as? String {
            LogD(str,function: function)
        }else if let obj = object as? NSObject {
            let formatter = DateFormatter()
            formatter.dateFormat = "HH:mm:ss"
            let date = formatter.string(from: Date())
            
            let properties = Mirror(reflecting: obj).children
            print("=================================================")
            print("\(date) Func: \(function) :")
            
            for property in properties {
                print("\(property.label!) : \(property.value)")
            }
            print("=================================================")
        }
    #endif
}
