//
//  HNPushNotification.swift
//
//
//  Created by oneweek on 3/21/17.
//  Copyright © 2017 Harry Nguyen. All rights reserved.
//

import UIKit

class PushNotificationHeper: NSObject {
    class func register(){
        
    }
    
    class func unRegister(){
        UIApplication.shared.unregisterForRemoteNotifications()
    }
    
    
//    class func receivedNotification(notification : OSNotification?){
//        if let notify = notification {
//            if let payload = notify.payload.rawPayload as NSDictionary? {
//                LogD("payload = \(payload)")
//            }
//        }
//    }
    
    
}
