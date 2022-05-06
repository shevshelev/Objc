//
//  NameViewController.swift
//  Objc
//
//  Created by Shevshelev Lev on 04.05.2022.
//

import UIKit

class NameViewController: UIViewController {
    
    var name: String!

    @IBOutlet var nameLabel: UILabel!
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        nameLabel.text = name
    }
}
