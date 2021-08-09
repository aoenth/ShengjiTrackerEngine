//
//  CardTests.swift
//  CardTests
//
//  Created by Kevin Peng on 2021-08-08.
//

import XCTest
@testable import ShengjiTracker

class CardTests: XCTestCase {
    func test_canInstantiateAceOfSpades() {
        let sut = Card(suit: .spades, rank: .ace)

        XCTAssertEqual(sut.suit, .spades)
        XCTAssertEqual(sut.rank, .ace)
    }

    func test_canInstantiate2OfSpades() {
        let sut = Card(suit: .spades, rank: .two)

        XCTAssertEqual(sut.suit, .spades)
        XCTAssertEqual(sut.rank, .two)
    }
}
