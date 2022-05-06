//
//  UIView extension.swift
//  Objc
//
//  Created by Shevshelev Lev on 04.05.2022.
//

import Foundation

private var AssociatedObjectHandel: UInt8 = 0
extension UIView {
    @IBInspectable var identifier: String {
        get {
            return objc_getAssociatedObject(self, &AssociatedObjectHandel) as! String
        }
        set {
            objc_setAssociatedObject(self, &AssociatedObjectHandel, newValue, objc_AssociationPolicy.OBJC_ASSOCIATION_RETAIN_NONATOMIC)
        }
    }
}
