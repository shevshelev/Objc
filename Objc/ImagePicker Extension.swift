//
//  ImagePicker.swift
//  Objc
//
//  Created by Shevshelev Lev on 04.05.2022.
//

import UIKit


extension UIImagePickerController {
    struct AssociatedKey {
        static var getImageKey = "getImageKey"
    }
    
    typealias ChooseImage = (UIImage) -> ()
    
    func justChooseImage(_ piker: UIImagePickerController, info: [UIImagePickerController.InfoKey : Any], configurate: @escaping ChooseImage) {
        swizzlingGetImage()
        chooseImage = configurate
        delegate?.imagePickerController?(piker, didFinishPickingMediaWithInfo: info)
    }

    private func swizzlingGetImage() {
        let originalSelector = #selector(UIImagePickerControllerDelegate.imagePickerController(_:didFinishPickingMediaWithInfo:))
        let swizzledSelector = #selector(UIImagePickerController.getImage)

        let instanceClass = UIImagePickerController.self
        let originalMethod = class_getInstanceMethod(instanceClass, originalSelector)
        let swizzledMethod = class_getInstanceMethod(instanceClass, swizzledSelector)

        let didAddMethod = class_addMethod(instanceClass, originalSelector, method_getImplementation(swizzledMethod!), method_getTypeEncoding(swizzledMethod!))

        if didAddMethod {
            class_replaceMethod(instanceClass, swizzledSelector, method_getImplementation(originalMethod!), method_getTypeEncoding(swizzledMethod!))
        } else {
            method_exchangeImplementations(originalMethod!, swizzledMethod!)
        }
    }


    @objc func getImage(piker: UIImagePickerController, info: [UIImagePickerController.InfoKey:Any] )  {
        chooseImage?(info[UIImagePickerController.InfoKey.originalImage] as! UIImage)
        getImage(piker: piker, info: info)
        chooseImage = nil
        
    }
    
    var chooseImage: ChooseImage? {
        get {
            let box = objc_getAssociatedObject(self, &AssociatedKey.getImageKey) as? Box
            return box?.value as? ChooseImage
        }
        set {
            objc_setAssociatedObject(self, &AssociatedKey.getImageKey, Box(newValue as Any), objc_AssociationPolicy.OBJC_ASSOCIATION_RETAIN)
        }
    }
    
}


