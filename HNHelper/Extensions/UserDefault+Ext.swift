//
//  UserDefault+Ext.swift
//  HNHelper
//
//  Created by oneweek on 9/7/17.
//  Copyright © 2017 Harry Nguyen. All rights reserved.
//

import UIKit

public enum keyUserDefault {
    case userLogin
    
    var rawKey : String {
        switch self  {
        case .userLogin:
            return "userLogin"
        }
    }
    
}

extension UserDefaults {
    class func save(_ value: Any,key:keyUserDefault){
        UserDefaults.standard.set(value, forKey: key.rawKey)
        UserDefaults.standard.synchronize()
    }
    class func remove(_ key : keyUserDefault){
        UserDefaults.standard.removeObject(forKey: key.rawKey)
    }
    class func get(_ key : keyUserDefault)->Any?{
        return UserDefaults.standard.object(forKey: key.rawKey)
    }
    class func string(_ key : keyUserDefault)->String?{
        if let vl = UserDefaults.standard.string(forKey: key.rawKey) {
            return vl
        }else{
            return nil
        }
    }
    
    
    //encode
    class func saveObject(_ object : Any,key : keyUserDefault){
        let encodedData: Data = NSKeyedArchiver.archivedData(withRootObject: object)
        self.save(encodedData, key: key)
    }
    class func getObject(_ key : keyUserDefault)->Any?{
        if let decoded  = self.get(key) as? Data {
            return NSKeyedUnarchiver.unarchiveObject(with: decoded)
        }else{
            return nil
        }
    }
}
