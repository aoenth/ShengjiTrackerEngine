//
//  PlayerTests.swift
//  PlayerTests
//
//  Created by Kevin Peng on 2021-08-08.
//

import XCTest
@testable import ShengjiTrackerEngine

class PlayerTests: XCTestCase {
    func test_emptyState_playerShouldHaveNoTerminatedSuits() {
        let sut = Player()

        for suit in Suit.allSuits {
            XCTAssertFalse(sut.isTerminal(for: suit))
        }
    }

    func test_terminatedSpadesAndHearts_playerShouldHaveTrackedTerminatedSuits() {
        let sut = Player()

        sut.terminate(suit: .spades)
        sut.terminate(suit: .hearts)

        XCTAssertTrue(sut.isTerminal(for: .spades))
        XCTAssertTrue(sut.isTerminal(for: .hearts))
        XCTAssertFalse(sut.isTerminal(for: .clubs))
        XCTAssertFalse(sut.isTerminal(for: .diamonds))
    }

    func test_terminatedSpadesTwice_playerShouldOnlyHaveTrackedSpades() {
        let sut = Player()

        sut.terminate(suit: .spades)
        sut.terminate(suit: .spades)

        XCTAssertTrue(sut.isTerminal(for: .spades))
        XCTAssertFalse(sut.isTerminal(for: .hearts))
        XCTAssertFalse(sut.isTerminal(for: .clubs))
        XCTAssertFalse(sut.isTerminal(for: .diamonds))
    }

    func test_shouldBeAbleToResetViaTrackableProtocol() {
        let sut = Player()

        sut.terminate(suit: .spades)
        sut.terminate(suit: .hearts)
        sut.start(level: 2)

        for suit in Suit.allSuits {
            XCTAssertFalse(sut.isTerminal(for: suit))
        }
    }
}
