//
//  App+Ext.swift
//  HNHelper
//
//  Created by oneweek on 9/7/17.
//  Copyright © 2017 Harry Nguyen. All rights reserved.
//

import UIKit

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
