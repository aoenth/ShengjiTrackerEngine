//
//  Game.swift
//  Game
//
//  Created by Kevin Peng on 2021-08-08.
//

import Foundation

class Game {
    var playedCards = [Card: Int]()
    var level = 2

    func start(level: Int = 2) {
        self.level = level
        playedCards.removeAll(keepingCapacity: true)
    }

    func playCard(_ card: Card) {
        guard playedCards[card] ?? 0 < 2 else { return }
        playedCards[card, default: 0] += 1
    }
}

struct Card: Hashable {
    let suit: Suit
    let rank: Rank

    static let leftBower = Card(suit: .none, rank: .leftBower)
    static let rightBower = Card(suit: .none, rank: .rightBower)
}

enum Suit: Int {
    case spades, hearts, clubs, diamonds, none
}

enum Rank: Int {
    case two = 2
    case three
    case four
    case five
    case six
    case seven
    case eight
    case nine
    case ten
    case jack
    case queen
    case king
    case ace
    case leftBower
    case rightBower
}
