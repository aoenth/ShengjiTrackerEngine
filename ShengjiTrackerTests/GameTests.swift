//
//  GameTests.swift
//  GameTests
//
//  Created by Kevin Peng on 2021-08-08.
//

import XCTest
@testable import ShengjiTracker

class GameTests: XCTestCase {
    func test_start_existingCards_shouldBeEmpty() {
        let sut = Game()

        sut.start()

        XCTAssertTrue(sut.playedCards.isEmpty)
    }

    func test_start_existingPlayedCards_shouldBeEmptied() {
        let sut = Game()
        let card = Card(suit: .spades, rank: .ace)

        sut.playCard(card)
        sut.start()

        XCTAssertTrue(sut.playedCards.isEmpty)
    }

    func test_playAceOfSpades_gameShouldContainCard() {
        let sut = Game()
        let aceOfSpades = Card(suit: .spades, rank: .ace)

        sut.start()
        sut.playCard(aceOfSpades)

        XCTAssertEqual(sut.playedCards, [aceOfSpades: 1])
    }

    func test_playAceOfSpades_gameShouldContain2Cards() {
        let sut = Game()
        let aceOfSpades = Card(suit: .spades, rank: .ace)

        sut.start()
        sut.playCard(aceOfSpades)
        sut.playCard(aceOfSpades)

        XCTAssertEqual(sut.playedCards, [aceOfSpades: 2])
    }

    func test_playAceOfSpadesThrice_gameShouldContain2Cards() {
        let sut = Game()
        let aceOfSpades = Card(suit: .spades, rank: .ace)

        sut.start()
        sut.playCard(aceOfSpades)
        sut.playCard(aceOfSpades)
        sut.playCard(aceOfSpades)

        XCTAssertEqual(sut.playedCards, [aceOfSpades: 2])
    }

    func test_playTwoDifferent_gameShouldContain2Cards() {
        let sut = Game()
        let aceOfSpades = Card(suit: .spades, rank: .ace)
        let kingOfClubs = Card(suit: .clubs, rank: .king)

        sut.start()
        sut.playCard(aceOfSpades)
        sut.playCard(kingOfClubs)

        XCTAssertEqual(sut.playedCards, [
            aceOfSpades: 1,
            kingOfClubs: 1
        ])
    }

    func test_playBowers_gameShouldContainBowers() {
        let sut = Game()
        let leftBower = Card.leftBower
        let rightBower = Card.rightBower

        sut.start()
        sut.playCard(leftBower)
        sut.playCard(rightBower)

        XCTAssertEqual(sut.playedCards, [
            leftBower: 1,
            rightBower: 1
        ])
    }
}
