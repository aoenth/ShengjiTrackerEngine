//
//  Game.swift
//  Game
//
//  Created by Kevin Peng on 2021-08-08.
//

import Foundation

protocol Trackable {
    func start(level: Int)
}

class Game: Trackable {
    var playedCards = [Card: Int]()
    var level = 2
    
    public func start(level: Int = 2) {
        self.level = level
        playedCards.removeAll(keepingCapacity: true)
    }

    public func playCard(_ card: Card) {
        guard playedCards[card] ?? 0 < 2 else { return }
        playedCards[card, default: 0] += 1
    }
}

public struct Card: Hashable {
    public let suit: Suit?
    public let rank: Rank

    public static let leftBower = Card(suit: .none, rank: .leftBower)
    public static let rightBower = Card(suit: .none, rank: .rightBower)
}

public enum Suit: UInt8, CaseIterable {
    case spades, hearts, clubs, diamonds
}

public enum Rank: UInt8, CaseIterable {
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
