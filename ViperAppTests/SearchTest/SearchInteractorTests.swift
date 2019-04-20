//
//  SearchInteractorTests.swift
//  ViperAppTests
//
//  Created by Oğulcan on 20.04.2019.
//  Copyright © 2019 Ogulcan. All rights reserved.
//

import XCTest
import Moya
@testable import ViperApp

class SearchInteractorTests: XCTestCase {

    var provider: MoyaProvider<TMDbApi>!
    
    override func setUp() {
        super.setUp()
        provider = MoyaProvider<TMDbApi>(stubClosure: MoyaProvider.immediatelyStub)
    }
    
    func testRetrieveList() {
        provider.request(.searchActors(p: "P")) { result in
            if case let .success(response) = result {
                do {
                    XCTAssertNoThrow(try response.filterSuccessfulStatusCodes())
                    XCTAssertNoThrow(try response.map(BaseResponse<[Actor]>.self))
                    
                    let baseResponse = try response.map(BaseResponse<[Actor]>.self)
                    XCTAssertEqual(baseResponse.page, 1)
                    XCTAssertGreaterThan(baseResponse.page, 0)
                    XCTAssertGreaterThan(baseResponse.total_pages, 0)
                    XCTAssertGreaterThan(baseResponse.results.count, 0)
                } catch let error {
                    XCTFail("Error: \(error.localizedDescription)")
                }
            }
        }
    }
}
