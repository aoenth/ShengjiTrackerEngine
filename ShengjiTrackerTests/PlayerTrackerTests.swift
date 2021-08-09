//
//  PlayerTrackerTests.swift
//  PlayerTrackerTests
//
//  Created by Kevin Peng on 2021-08-08.
//

import XCTest
@testable import ShengjiTracker

class PlayerTrackerTests: XCTestCase {
    func test_start_playerShouldHaveNoSuitsTerminated() {
        let sut = PlayerTracker()

        for player in sut.players {
            for suit in Suit.allSuits {
                XCTAssertFalse(player.isTerminal(for: suit))
            }
        }
    }

    func test_playerTerminatedSpades_shouldTrackTermination() {
        let sut = PlayerTracker()
        let terminatedSuit = Suit.spades

        sut.trackTerminalSuit(terminatedSuit, forPlayer: 3)

        XCTAssertTrue(sut.players[3].isTerminal(for: .spades))
    }

    func test_playerTerminatedSpadesAndHearts_shouldTrackTerminations() {
        let sut = PlayerTracker()

        sut.trackTerminalSuit(.spades, forPlayer: 3)
        sut.trackTerminalSuit(.hearts, forPlayer: 3)

        XCTAssertTrue(sut.players[3].isTerminal(for: .spades))
        XCTAssertTrue(sut.players[3].isTerminal(for: .hearts))
    }

    func test_playerTerminatedSpadesAndHearts_shouldBeAbleToKnowPlayer_sTerminaltion() {
        let sut = PlayerTracker()
        sut.trackTerminalSuit(.spades, forPlayer: 3)
        sut.trackTerminalSuit(.hearts, forPlayer: 3)

        XCTAssertTrue(sut.players[3].isTerminal(for: .spades))
        XCTAssertTrue(sut.players[3].isTerminal(for: .hearts))
        XCTAssertFalse(sut.players[3].isTerminal(for: .clubs))
        XCTAssertFalse(sut.players[3].isTerminal(for: .diamonds))
    }

    func test_gameRestart_playerShouldHaveNoSuitsTerminated() {
        let sut = PlayerTracker()
        sut.trackTerminalSuit(.spades, forPlayer: 3)
        sut.trackTerminalSuit(.hearts, forPlayer: 3)

        sut.didStartNewGame()

        for player in sut.players {
            for suit in Suit.allSuits {
                XCTAssertFalse(player.isTerminal(for: suit))
            }
        }
    }

}
