//
//  UILocalNotification+Ext.swift
//  HNHelper
//
//  Created by oneweek on 9/7/17.
//  Copyright © 2017 Harry Nguyen. All rights reserved.
//

import UIKit


extension UILocalNotification {
    class func push(timestamp : Double,message : String){
        let notifi = UILocalNotification()
        notifi.fireDate = Date(timeIntervalSince1970: timestamp)
        notifi.alertBody = message
        notifi.repeatInterval = NSCalendar.Unit(rawValue: 0)
        notifi.soundName = UILocalNotificationDefaultSoundName
        UIApplication.shared.scheduleLocalNotification(notifi)
    }
    class func remove(timestamp:Double){
        for notification in UIApplication.shared.scheduledLocalNotifications! {
            //            if (notification.fireDate == Date(timeIntervalSince1970: timestamp)) {
            UIApplication.shared.cancelLocalNotification(notification)
            //                break
            //            }
        }
    }
}
