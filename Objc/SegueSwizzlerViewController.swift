//
//  SegueSwizzlerViewController.swift
//  Objc
//
//  Created by Shevshelev Lev on 04.05.2022.
//

import UIKit
//import ObjectiveC

class SegueSwizzlerViewController: UIViewController, UIImagePickerControllerDelegate, UINavigationControllerDelegate {
    
    @IBOutlet var nameTF: UITextField!
    
    @IBOutlet var someImageView: UIImageView!
    
    
    @IBAction func buttonPressed(_ sender: Any) {
        
        performSegueWithIdentifier(identifier: "nameSegue", sender: nil) {[unowned self] segue in
            guard let vc = segue.destination as? NameViewController else { return }
            vc.name = self.nameTF.text
        }
    }
    @IBAction func newButtomPressed(_ sender: Any) {
        let imagePiker = UIImagePickerController()
        imagePiker.delegate = self
//        imagePiker.justChooseImage(<#T##piker: UIImagePickerController##UIImagePickerController#>, info: <#T##[UIImagePickerController.InfoKey : Any]#>) { <#UIImage#> in
//            <#code#>
//        }
        present(imagePiker, animated: true)
    }
    
    
}


