//
//  ActorEntityTest.swift
//  ViperAppTests
//
//  Created by Oğulcan on 20.04.2019.
//  Copyright © 2019 Ogulcan. All rights reserved.
//

import XCTest
@testable import ViperApp

class ActorEntityTests: XCTestCase {

    func testActorSet() {
        let actor = Actor(id: 1, popularity: 11.742, profile_path: "asdfghjkl.jpg", name: "Name Surname", adult: true)
        XCTAssertEqual(actor.id, 1)
        XCTAssertEqual(actor.popularity, 11.742)
        XCTAssertEqual(actor.profile_path, "asdfghjkl.jpg")
        XCTAssertEqual(actor.name, "Name Surname")
        XCTAssert(actor.adult)
    }
}
