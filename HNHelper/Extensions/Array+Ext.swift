//
//  Array+Ext.swift
//  HNHelper
//
//  Created by oneweek on 9/7/17.
//  Copyright © 2017 Harry Nguyen. All rights reserved.
//

import UIKit

extension Array{
    func convertToJson()->String{
        do {
            let jsonData = try JSONSerialization.data(withJSONObject: self, options: .prettyPrinted)
            return "\(String(data: jsonData, encoding: .utf8)!)"
        }catch {
            return ""
        }
    }
    
}
