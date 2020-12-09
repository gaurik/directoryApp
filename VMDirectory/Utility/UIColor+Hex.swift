//
//  UIColor+Hex.swift
//  VMDirectory
//
//  Created by Gauri Rohan on 07/12/20.
//  Copyright © 2020 Gauri. All rights reserved.
//

import Foundation
import UIKit

extension UIColor {
    
    /// an init method to convert hex value to UIcolor
    ///
    /// - Parameters:
    ///     - hex: hex value passed as a string
    ///     - alpha: alpha value range between 0 to 1, default is 1.0
    ///
    convenience init(hex: String, alpha: Float = 1.0) {
        var cString: String = hex.trimmingCharacters(in: .whitespacesAndNewlines).uppercased()
        if cString.hasPrefix("#") {
            cString.remove(at: cString.startIndex)
        }
        
        //TODO: check for valid hex string
        var rgbValue: UInt64 = 0
        Scanner(string: cString).scanHexInt64(&rgbValue)
        
        self.init (
            red: CGFloat((rgbValue & 0xFF0000) >> 16) / 255.0,
            green: CGFloat((rgbValue & 0x00FF00) >> 8) / 255.0,
            blue: CGFloat(rgbValue & 0x0000FF) / 255.0,
            alpha: CGFloat(1.0)
        )
    }
}
