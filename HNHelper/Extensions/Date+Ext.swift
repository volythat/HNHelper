//
//  Date+Ext.swift
//  HNHelper
//
//  Created by oneweek on 9/7/17.
//  Copyright © 2017 Harry Nguyen. All rights reserved.
//

import UIKit


extension Date{
    func string(fm:String)->String{
        let format = DateFormatter()
        format.dateFormat = fm
        return format.string(from: self)
    }
}
