//
//  PlayerTracker.swift
//  PlayerTracker
//
//  Created by Kevin Peng on 2021-08-08.
//

import Foundation

class PlayerTracker: Trackable {
    let players = [
        Player(),
        Player(),
        Player(),
        Player(),
    ]

    func trackTerminalSuit(_ suit: Suit, forPlayer index: Int) {
        guard players.indices ~= index else { return }
        players[index].terminate(suit: suit)
    }

    func start(level: Int) {
        players.forEach {
            $0.start(level: level)
        }
    }
}

class Player: Trackable {
    private var terminalSuits: Set<Suit> = []

    func isTerminal(for suit: Suit) -> Bool {
        terminalSuits.contains(suit)
    }

    func terminate(suit: Suit) {
        terminalSuits.insert(suit)
    }

    func start(level: Int) {
        terminalSuits.removeAll(keepingCapacity: true)
    }
}
