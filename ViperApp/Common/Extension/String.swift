//
//  String.swift
//  ViperApp
//
//  Created by Oğulcan on 19.04.2019.
//  Copyright © 2019 Ogulcan. All rights reserved.
//

import Foundation

extension String {
    
    var utf8Encoded: Data {
        return data(using: .utf8)!
    }
    
    var url: URL {
        return URL(string: self)!
    }
}
