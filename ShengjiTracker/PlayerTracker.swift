//
//  PlayerTracker.swift
//  PlayerTracker
//
//  Created by Kevin Peng on 2021-08-08.
//

import Foundation

class PlayerTracker {
    let players = [
        Player(),
        Player(),
        Player(),
        Player(),
    ]

    func trackTerminalSuit(_ suit: Suit, forPlayer index: Int) {
        players[index].terminate(suit: suit)
    }

    func didStartNewGame() {
        players.forEach {
            $0.didStartNewGame()
        }
    }
}

class Player {
    private var terminalSuits: Set<Suit> = []

    func isTerminal(for suit: Suit) -> Bool {
        terminalSuits.contains(suit)
    }

    func terminate(suit: Suit) {
        terminalSuits.insert(suit)
    }

    func didStartNewGame() {
        terminalSuits.removeAll(keepingCapacity: true)
    }
}
