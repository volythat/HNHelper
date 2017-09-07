//
//  HNCamera.swift
//
//
//  Created by oneweek on 4/26/17.
//  Copyright © 2017 Harry Nguyen. All rights reserved.
//

import UIKit
import AVFoundation
import AudioToolbox


class HNCamera: NSObject {
    var camera : UIImagePickerController!
    
    static let shared: HNCamera = {
        var instance = HNCamera()
        // setup code
        
        return instance
    }()
    
    typealias completed = (_ image:UIImage?) -> Void
    var completedGetPhoto: completed?
    var vcPresent : UIViewController?
    var widthResize : CGFloat = 300.0
    
    func convertToImage(_ img: UIImage) -> UIImage {
        var newImage : UIImage
        
        let ratioW: CGFloat = widthResize / img.size.width
        if img.size.height * ratioW < widthResize {
            let ratioH: CGFloat = widthResize / img.size.height
            newImage = self.imageWithImage(img, convertToSize: CGSize(width: img.size.width * ratioH, height: widthResize))
        }
        else {
            newImage = self.imageWithImage(img, convertToSize: CGSize(width: widthResize, height: img.size.height * ratioW))
        }
        return newImage
    }
    
    func imageWithImage(_ image: UIImage, convertToSize size: CGSize) -> UIImage {
        UIGraphicsBeginImageContext(size)
        image.draw(in: CGRect(x: 0, y: 0, width: size.width, height: size.height))
        let destImage = UIGraphicsGetImageFromCurrentImageContext()
        UIGraphicsEndImageContext()
        return destImage!
    }
    func checkCameraAuthorization() {
        let cameraAuthorizationStatus = AVCaptureDevice.authorizationStatus(forMediaType: AVMediaTypeVideo)
        
        switch cameraAuthorizationStatus {
        case .authorized:
            LogD("Authorized")
            break
        case .restricted:
            LogD("Restricted")
            break
        case .denied:
            LogD("Denied")
            HNAlert.alert(title: "Camera access denied".localized(), message: "You have disabled camera access".localized())
            break
        case .notDetermined:
            LogD("NotDetermined")
            break
        }
    }
    
    func getPhoto(fromGallery:Bool){
        if fromGallery == true {
            if UIImagePickerController.isSourceTypeAvailable(.photoLibrary) == true {
                // check authorization
                if (self.camera == nil){
                    self.camera = UIImagePickerController()
                }
                self.camera.sourceType = .photoLibrary
                self.camera.isEditing = true
                self.camera.allowsEditing = true
                self.camera.delegate = self
                if let vc = self.vcPresent {
                    vc.present(self.camera, animated: true , completion: nil)
                }
            }
        }else{
            if UIImagePickerController.isSourceTypeAvailable(.camera) == true {
                self.checkCameraAuthorization()
                if (self.camera == nil){
                    self.camera = UIImagePickerController()
                }
                self.camera.sourceType = .camera
                self.camera.isEditing = true
                self.camera.allowsEditing = true
                self.camera.delegate = self
                if let vc = self.vcPresent {
                    vc.present(self.camera, animated: true , completion: nil)
                }
            }else{
                HNAlert.alert(title: "Error".localized(), message: "Your device have not camera!".localized())
            }
        }
    }
    
    func showAlert(_ view:UIViewController,resize:CGFloat,completed: @escaping completed){
        self.completedGetPhoto = completed
        self.vcPresent = view
        self.widthResize = resize
        
        HNAlert.alertWithStyleButton(view,
                                     title: "Choose...".localized(),
                                     message: "",
                                     buttons: [AlertButton("Camera".localized()),
                                               AlertButton("Gallery".localized()),
                                               AlertButton("Close".localized())],
                                     style: .actionSheet,
                                     sender: nil) { (action) in
                                        if action.title == "Camera".localized() {
                                            self.getPhoto(fromGallery: false)
                                        }else if action.title == "Gallery".localized() {
                                            self.getPhoto(fromGallery: true)
                                        }
        }
    }
    
}

extension HNCamera : UIImagePickerControllerDelegate,UINavigationControllerDelegate {
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [String : Any]) {
        if let pickedImage = info[UIImagePickerControllerEditedImage] as? UIImage {
            if let vc = self.vcPresent {
                vc.dismiss(animated: true , completion: {
                    self.camera = nil
                    let img = self.convertToImage(pickedImage)
                    self.completedGetPhoto?(img)
                })
            }
        }else{
            if let vc = self.vcPresent {
                vc.dismiss(animated: true , completion: { 
                    self.camera = nil
                    self.completedGetPhoto?(nil)
                })
            }
        }
        
    }
    
    func imagePickerControllerDidCancel(_ picker: UIImagePickerController) {
        if let vc = self.vcPresent {
            vc.dismiss(animated: true , completion: {
                self.camera = nil
                self.completedGetPhoto?(nil)
            })
        }
    }
}
