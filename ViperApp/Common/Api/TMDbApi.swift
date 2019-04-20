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
    
    /**
    case listMovies()
    case listTrending()
    case listGenres()
    ....
    */
}

extension TMDbApi: TargetType {
    
    var baseURL: URL {
        return Constant.API_BASE_URL.url
    }
    
    var path: String {
        switch self {
        case .listActors():
            return "person/popular"
        case .searchActors(_):
            return "search/person"
        }
    }
    
    var method: Moya.Method {
        return .get
    }
    
    var task: Task {
        switch self {
            case .listActors():
                return .requestParameters(parameters: ["api_key": Constant.API_PRIVATE_KEY,
                                                       "language": Constant.API_LANGUAGE,
                                                       "page": 1],
                                          encoding: URLEncoding.queryString)
            case .searchActors(let p):
                return .requestParameters(parameters: ["api_key": Constant.API_PRIVATE_KEY,
                                                       "language": Constant.API_LANGUAGE,
                                                       "query": p,
                                                       "page": 1],
                                          encoding: URLEncoding.queryString)
        }
    }
    
    var headers: [String : String]? {
        return ["Content-type": "application/json"]
    }
    
    var sampleData: Data {
        switch self {
        case .listActors():
            return "{ \"page\": 1, \"total_results\": 1074, \"total_pages\": 54, \"results\": [] }".utf8Encoded
        case .searchActors(_):
            return "{ \"page\": 1, \"total_results\": 17826, \"total_pages\": 892, \"results\": [] }".utf8Encoded
        }
    }
}
