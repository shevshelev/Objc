//
//  Test.swift
//  Objc
//
//  Created by Shevshelev Lev on 04.05.2022.
//

import Foundation


@objc class CheckValue: NSObject {
    
    @objc func checkIntFromString(string: String) -> Bool {
        Int(string) != nil
    }
    
}
