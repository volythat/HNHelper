//
//  HNShare.swift
//
//
//  Created by oneweek on 5/22/17.
//  Copyright © 2017 Harry Nguyen. All rights reserved.
//

//import UIKit
//import FBSDKShareKit
//import FacebookCore
//
//class HNShare: NSObject {
//    static let shared: HNShare = {
//        var instance = HNShare()
//        // setup code
//        
//        return instance
//    }()
//    
//    typealias completed = (_ shared:Bool) -> Void
//    var completedShare: completed?
//    
//    class func shareApp(_ vc : UIViewController){
//        if let myWebsite = URL(string: linkItunes) {
//            let share = FBSDKShareLinkContent()
//            share.contentURL = myWebsite
//            share.hashtag = FBSDKHashtag(string: hashTagFb)
//            
//            let facebookURL = URL(string: "fbauth2://app")
//            if(UIApplication.shared.canOpenURL(facebookURL!)){
//                FBSDKShareDialog.show(from: vc, with: share, delegate: nil)
//            }else{
//                let dialog : FBSDKShareDialog = FBSDKShareDialog()
//                dialog.fromViewController = vc
//                dialog.shareContent = share
//                dialog.mode = FBSDKShareDialogMode.feedWeb
//                dialog.show()
//            }
//        }
//    }
//    
//    func shareApp(_ vc: UIViewController, completed:@escaping completed){
//        self.completedShare = completed
//        if let myWebsite = URL(string: linkItunes) {
//            let share = FBSDKShareLinkContent()
//            share.contentURL = myWebsite
//            share.hashtag = FBSDKHashtag(string: hashTagFb)
//            
//            let facebookURL = URL(string: "fbauth2://app")
//            if(UIApplication.shared.canOpenURL(facebookURL!)){
//                FBSDKShareDialog.show(from: vc, with: share, delegate: self)
//            }else{
//                let dialog : FBSDKShareDialog = FBSDKShareDialog()
//                dialog.fromViewController = vc
//                dialog.shareContent = share
//                dialog.delegate = self
//                dialog.mode = FBSDKShareDialogMode.feedWeb
//                dialog.show()
//            }
//        }
//    }
//}
//extension HNShare : FBSDKSharingDelegate {
//    //MARK: - Delegate
//    func sharerDidCancel(_ sharer: FBSDKSharing!) {
//        LogD("cancel")
//        self.completedShare?(false)
//    }
//    func sharer(_ sharer: FBSDKSharing!, didFailWithError error: Error!) {
//        LogD("didFailWithError = \(error.localizedDescription)")
//        self.completedShare?(false)
//    }
//    func sharer(_ sharer: FBSDKSharing!, didCompleteWithResults results: [AnyHashable : Any]!) {
//        LogD("didCompleteWithResults = \(results)")
//        self.completedShare?(true)
//    }
//}
