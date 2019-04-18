//
//  BaseService.swift
//  ViperApp
//
//  Created by Oğulcan on 19.04.2019.
//  Copyright © 2019 Ogulcan. All rights reserved.
//

import Foundation
import Moya

class BaseService<T: TargetType, S: Codable> {
    
    func call(_ target: T, completion: @escaping (S?) -> ()) {
        MoyaProvider<T>().request(target, completion: { (result) in
            switch result {
                case let .success(moyaResponse):
                    do {
                        _ = try moyaResponse.filterSuccessfulStatusCodes()
                        let baseResponse = try moyaResponse.map(BaseResponse<S>.self)
                        completion(baseResponse.results)
                    } catch {
                        completion(nil)
                    }
                    break
                case let .failure(moyaError):
                    print("Error (failure): \(String(describing: moyaError.failureReason))")
                    completion(nil)
                    break
            }
        })
    }

}
