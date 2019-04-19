//
//  Reuse.swift
//  ViperApp
//
//  Created by Oğulcan on 19.04.2019.
//  Copyright © 2019 Ogulcan. All rights reserved.
//

import Foundation

protocol Reusable {
    
    static var reuseID: String { get }
}

extension Reusable {
    static var reuseID: String {
        return String(describing: self)
    }
}
