//
//  R.swift
//  CobraApp
//
//  Created by Мурат Кудухов on 03.06.2023.
//

import UIKit

enum R {
    enum Colors {
        
        static let green = UIColor(hexString: "#00D971")
        static let sep = UIColor(hexString: "#2D344B")
        static let text = UIColor(hexString: "#EBEBF5")
        static let active = UIColor(hexString: "#4870FF")
        static let inactive = UIColor(hexString: "#8E8E93")
        static let background = UIColor(hexString: "#141927")
        static let bar = UIColor(hexString: "#21283F")
        static let orange = UIColor(hexString: "#FF9C41")
    }
    enum Images {
        static let moon = UIImage(named: "moon")
        static let music = UIImage(named: "music")
        static let profile = UIImage(named: "profile")
        static let allButton = UIImage(named: "dots")
        static let ambient = UIImage(named: "ambient")
        static let kids = UIImage(named: "kids")
        static let lock = UIImage(named: "lock")
        static let star = UIImage(named: "star")
        
    }
    
    enum Fonts {
        //        static func AbbZee(with size: CGFloat) -> UIFont {
        //            UIFont(name: "ABeeZee", size: size) ?? UIFont()
        static func Italic(with size: CGFloat) -> UIFont {
            UIFont(name: "GillSans-SemiBoldItalic", size: size) ?? UIFont()
            
            
        }
        static func nonItalic(with size: CGFloat) -> UIFont {
            UIFont(name: "GillSans-SemiBold", size: size) ?? UIFont()
        }
    }
}
