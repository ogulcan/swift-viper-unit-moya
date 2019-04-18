//
//  TMDbApi.swift
//  ViperApp
//
//  Created by Oğulcan on 18.04.2019.
//  Copyright © 2019 Ogulcan. All rights reserved.
//

import Foundation
import Moya

enum TMDbApi {
    
    case listActors()
    case searchActors(p: String)
    
    //case listMovies()
    //case listTrending()
    //case listGenres()
}

extension TMDbApi: TargetType {
    
    var baseURL: URL {
        return URL(string: Constant.API_BASE_URL)!
    }
    
    var path: String {
        switch self {
        case .listActors():
            return ""
        case .searchActors(_):
            return ""
        }
    }
    
    var method: Moya.Method {
        return .post
    }
    
    var task: Task {
        return .requestPlain
    }
    
    var headers: [String : String]? {
        return ["Content-type": "application/json"]
    }
    
    var sampleData: Data {
        return Data(base64Encoded: "Sample")!
    }
}
