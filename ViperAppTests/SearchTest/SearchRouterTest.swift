//
//  SearchRouterTest.swift
//  ViperAppTests
//
//  Created by Oğulcan on 20.04.2019.
//  Copyright © 2019 Ogulcan. All rights reserved.
//

import XCTest
@testable import ViperApp

class SearchRouterTest: XCTestCase {

    func testTopVCIsSearchVCWhenPresented() {
        let navController = SearchRouter.createSearchModule()
        XCTAssertTrue(navController.viewControllers.first is SearchViewController)
    }
}
