//
//  HNFont.swift
//
//
//  Created by oneweek on 7/6/17.
//  Copyright © 2017 Harry Nguyen. All rights reserved.
//



//AvenirNext-Bold
//AvenirNext-BoldItalic
//AvenirNext-DemiBold
//AvenirNext-DemiBoldItalic
//AvenirNext-Heavy
//AvenirNext-HeavyItalic
//AvenirNext-Italic
//AvenirNext-Medium
//AvenirNext-MediumItalic
//AvenirNext-Regular
//AvenirNext-UltraLight
//AvenirNext-UltraLightItalic

//HelveticaNeue
//HelveticaNeue-Bold
//HelveticaNeue-BoldItalic
//HelveticaNeue-CondensedBlack
//HelveticaNeue-CondensedBold
//HelveticaNeue-Italic
//HelveticaNeue-Light
//HelveticaNeue-LightItalic
//HelveticaNeue-Medium
//HelveticaNeue-MediumItalic
//HelveticaNeue-Thin
//HelveticaNeue-ThinItalic
//HelveticaNeue-UltraLight
//HelveticaNeue-UltraLightItalic

import UIKit

enum FontName : String {
    case AvenirNextRegular = "AvenirNext-Regular"
    case AvenirNextMedium = "AvenirNext-Medium"
    case AvenirNextBold = "AvenirNext-Bold"
    
    case HelveticaNeue = "HelveticaNeue"
    case HelveticaNeueMedium = "HelveticaNeue-Medium"
    case HelveticaNeueBold = "HelveticaNeue-Bold"
}

extension UIFont {
    class func font(_ name:FontName,_ size:CGFloat)->UIFont{
        return UIFont(name: name.rawValue, size: size)!
    }
}
