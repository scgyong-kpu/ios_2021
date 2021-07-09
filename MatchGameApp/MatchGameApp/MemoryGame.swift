//
//  MemoryGame.swift
//  MatchGameApp
//
//  Created by Kiyong Kim on 2021/07/09.
//

import Foundation

struct Card {
    var open: Bool
    let number: Int
}

class MemoryGame: ObservableObject {
    struct dimen {
        static let cols = 3
        static let rows = 6
    }
    @Published var cards: [Card] = []
    init() {
        start()
    }
    func start() {
        cards = []
        let max_num = dimen.cols * dimen.rows / 2
        for n in 1 ... max_num {
            cards.append(Card(open: true, number: n))
            cards.append(Card(open: false, number: n))
        }
    }
    func card(row: Int, col: Int) -> Card {
        cards[row * dimen.cols + col]
    }
    func toggle(row: Int, col: Int) {
        let index = row * dimen.cols + col
        cards[index].open.toggle()
    }
}
