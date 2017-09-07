//
//  String+Ext.swift
//  HNHelper
//
//  Created by oneweek on 9/7/17.
//  Copyright © 2017 Harry Nguyen. All rights reserved.
//

import UIKit


extension String {
    public func encode()-> String {
        return self.addingPercentEncoding(withAllowedCharacters: .urlFragmentAllowed)!
    }
    public func trim() -> String
    {
        return self.trimmingCharacters(in: CharacterSet.whitespacesAndNewlines)
    }
    
    public func localized() -> String {
        return NSLocalizedString(self, comment: "")
    }
    
    public func localizedFormat( _ args: CVarArg...) -> String {
        
        return String(format: self.localized(), arguments: args)
    }
    public func isValidEmail() -> Bool {
        // print("validate calendar: \(testStr)")
        let emailRegEx = "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,}"
        
        let emailTest = NSPredicate(format:"SELF MATCHES %@", emailRegEx)
        return emailTest.evaluate(with: self)
    }
    func fromBase64() -> String? {
        guard let data = Data(base64Encoded: self) else {
            return nil
        }
        
        return String(data: data, encoding: .utf8)
    }
    
    func toBase64() -> String {
        return Data(self.utf8).base64EncodedString()
    }
}

extension NSString {
    public func localized() -> String {
        return NSLocalizedString(self as String, comment: "")
    }
    
    public func trim() -> String
    {
        return self.trimmingCharacters(in: CharacterSet.whitespacesAndNewlines)
    }
}
