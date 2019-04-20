//
//  ListRouterTest.swift
//  ViperAppTests
//
//  Created by Oğulcan on 20.04.2019.
//  Copyright © 2019 Ogulcan. All rights reserved.
//


import XCTest
@testable import ViperApp

class ListRouterTests: XCTestCase {
    
    func testTopVCIsListVCWhenPresented() {
        let navController = ListRouter.createListModule()
        XCTAssertTrue(navController.viewControllers.first is ListViewController)
    }
}
