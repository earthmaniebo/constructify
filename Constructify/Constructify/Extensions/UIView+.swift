//
//  UIView+.swift
//  Constructify
//
//  Created by Earth Maniebo on 28/09/2019.
//  Copyright © 2019 Earth Maniebo. All rights reserved.
//

import UIKit

@IBDesignable
extension UIView {
    
    @IBInspectable public var cornerRadius: CGFloat {
        set {
            layer.cornerRadius = newValue
            clipsToBounds = newValue > 0
        }
        get {
            return layer.cornerRadius
        }
    }
    
    @IBInspectable public var borderColor: UIColor? {
        set { layer.borderColor = newValue!.cgColor }
        get {
            if let color = layer.borderColor {
                return UIColor(cgColor:color)
            } else {
                return nil
            }
        }
    }
    
    @IBInspectable public var borderWidth: CGFloat {
        set { layer.borderWidth = newValue }
        get { return layer.borderWidth }
    }

    @IBInspectable public var shadow: Bool {
        set {
            if shadow {
                layer.shadowColor = UIColor.black.cgColor
                layer.shadowOpacity = 0.1
                layer.shadowOffset = CGSize(width: 0, height: 1)
                layer.shadowRadius = 2
                layer.masksToBounds = false
            } else {
                layer.shadowColor = nil
                layer.shadowOpacity = 0
                layer.shadowOffset = .zero
                layer.shadowRadius = 0
                layer.masksToBounds = false
            }
        }
        get {
            return layer.shadowColor != nil
        }
    }
    
}
