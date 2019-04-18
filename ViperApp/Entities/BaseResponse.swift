//
//  BaseResponse.swift
//  ViperApp
//
//  Created by Oğulcan on 19.04.2019.
//  Copyright © 2019 Ogulcan. All rights reserved.
//

import Foundation

struct BaseResponse<S: Codable>: Codable {
    
    let page: Int
    let total_results: Int
    let total_pages: Int
    var results: S

}
