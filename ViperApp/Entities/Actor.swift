//
//  Actor.swift
//  ViperApp
//
//  Created by Oğulcan on 19.04.2019.
//  Copyright © 2019 Ogulcan. All rights reserved.
//

import Foundation

struct Actor: Codable {
    
    let id: Int
    let popularity: Float
    let profile_path: String
    let name: String
    let adult: Bool

    func getImage() -> URL {
        return URL(string: "https://image.tmdb.org/t/p/w200\(profile_path)")!
    }
}
