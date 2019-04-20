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
            return "{ \"page\": 1, \"total_results\": 123789, \"total_pages\": 6190, \"results\": [{ \"popularity\": 7.417, \"id\": 995721, \"profile_path\": \"zctv4V20rsTpyvCbCM8mUbRfYZd.jpg\", \"name\": \"Nirmal Pandey\", \"known_for\": [{ \"vote_average\": 4.8, \"vote_count\": 20, \"id\": 132744, \"video\": false, \"media_type\": \"movie\", \"title\": \"One 2 Ka 4\", \"popularity\": 2.001, \"poster_path\": \"l2rVlQOqPnuw29DfYruQOQ4B25j.jpg\", \"original_language\": \"hi\", \"original_title\": \"ssss\", \"genre_ids\": [28, 18, 35], \"backdrop_path\": \"dsm9syHSMlshwVyWcb9TeLfdLpG.jpg\", \"adult\": false, \"overview\": \"After his partner, Javed, is killed, Arun takes care of the four orphaned children with the help Geeta. He discovers Javed's death was a homicide, and as he investigates, he learns that Geeta is leading a double life.\", \"release_date\": \"2001-03-30\" }, { \"vote_average\": 6.5, \"vote_count\": 21, \"id\": 14785, \"video\": false, \"media_type\": \"movie\", \"title\": \"Bandit Queen\", \"popularity\": 2.411, \"poster_path\": \"ky2ebf9eEb3LbkxNlc9oo97kYbY.jpg\", \"original_language\": \"hi\", \"original_title\": \"Bandit Queen\", \"genre_ids\": [18], \"backdrop_path\": \"tL5tK1zyCHUX2lESMw0DMZevw77.jpg\", \"adult\": false, \"overview\": \"Born a lower-caste girl in rural India's patriarchal society, \\\"married\\\" at 11, repeatedly raped and brutalized, Phooland Devi finds freedom only as an avenging warrior, the eponymous Bandit Queen. Devi becomes a kind a bloody Robin Hood; this extraordinary biographical film offers both a vivid portrait of a driven woman and a savage critique of the society that made her.\", \"release_date\": \"1995-06-30\" }, { \"vote_average\": 5.9, \"vote_count\": 9, \"id\": 78827, \"video\": false, \"media_type\": \"movie\", \"title\": \"Deewangee\", \"popularity\": 1.119, \"poster_path\": \"fXVVQbpnsqvx0jDLjY2Xwa0RwFR.jpg\", \"original_language\": \"hi\", \"original_title\": \"Deewangee\", \"genre_ids\": [10749, 18], \"backdrop_path\": \"gBZqi4f6uzuEhFDtoFvPHukjaat.jpg\", \"adult\": false, \"overview\": \"Bollywoods take on Primal Fear (1996). Though it copies the Hollywood version for most of the first half of the film, the second half is entirely original (though its more an outcome of 2 requirements of the Hindi movies: 1)Nearing the 3 hour mark instead of the 2 hour duration preferred by Hollywood &amp; 2)Good should always prevail over the bad)\", \"release_date\": \"2002-10-25\" }], \"adult\": false}]}".utf8Encoded
        case .searchActors(_):
            return "{ \"page\": 1, \"total_results\": 123789, \"total_pages\": 6190, \"results\": [{ \"popularity\": 7.417, \"id\": 995721, \"profile_path\": \"zctv4V20rsTpyvCbCM8mUbRfYZd.jpg\", \"name\": \"Nirmal Pandey\", \"known_for\": [{ \"vote_average\": 4.8, \"vote_count\": 20, \"id\": 132744, \"video\": false, \"media_type\": \"movie\", \"title\": \"One 2 Ka 4\", \"popularity\": 2.001, \"poster_path\": \"l2rVlQOqPnuw29DfYruQOQ4B25j.jpg\", \"original_language\": \"hi\", \"original_title\": \"ssss\", \"genre_ids\": [28, 18, 35], \"backdrop_path\": \"dsm9syHSMlshwVyWcb9TeLfdLpG.jpg\", \"adult\": false, \"overview\": \"After his partner, Javed, is killed, Arun takes care of the four orphaned children with the help Geeta. He discovers Javed's death was a homicide, and as he investigates, he learns that Geeta is leading a double life.\", \"release_date\": \"2001-03-30\" }, { \"vote_average\": 6.5, \"vote_count\": 21, \"id\": 14785, \"video\": false, \"media_type\": \"movie\", \"title\": \"Bandit Queen\", \"popularity\": 2.411, \"poster_path\": \"ky2ebf9eEb3LbkxNlc9oo97kYbY.jpg\", \"original_language\": \"hi\", \"original_title\": \"Bandit Queen\", \"genre_ids\": [18], \"backdrop_path\": \"tL5tK1zyCHUX2lESMw0DMZevw77.jpg\", \"adult\": false, \"overview\": \"Born a lower-caste girl in rural India's patriarchal society, \\\"married\\\" at 11, repeatedly raped and brutalized, Phooland Devi finds freedom only as an avenging warrior, the eponymous Bandit Queen. Devi becomes a kind a bloody Robin Hood; this extraordinary biographical film offers both a vivid portrait of a driven woman and a savage critique of the society that made her.\", \"release_date\": \"1995-06-30\" }, { \"vote_average\": 5.9, \"vote_count\": 9, \"id\": 78827, \"video\": false, \"media_type\": \"movie\", \"title\": \"Deewangee\", \"popularity\": 1.119, \"poster_path\": \"fXVVQbpnsqvx0jDLjY2Xwa0RwFR.jpg\", \"original_language\": \"hi\", \"original_title\": \"Deewangee\", \"genre_ids\": [10749, 18], \"backdrop_path\": \"gBZqi4f6uzuEhFDtoFvPHukjaat.jpg\", \"adult\": false, \"overview\": \"Bollywoods take on Primal Fear (1996). Though it copies the Hollywood version for most of the first half of the film, the second half is entirely original (though its more an outcome of 2 requirements of the Hindi movies: 1)Nearing the 3 hour mark instead of the 2 hour duration preferred by Hollywood &amp; 2)Good should always prevail over the bad)\", \"release_date\": \"2002-10-25\" }], \"adult\": false}]}".utf8Encoded
        }
    }
}
