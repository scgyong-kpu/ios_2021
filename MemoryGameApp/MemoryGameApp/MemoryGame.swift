//
//  MemoryGame.swift
//  MemoryGameApp
//
//  Created by Kiyong Kim on 2021/07/09.
//

import Foundation

public enum CardState {
    case closed, open, removed
}

struct Card {
    var cardState: CardState
    let number: Int
}

class MemoryGame: ObservableObject {
    @Published var cards: [Card] = []
    init() {
        start()
    }
    func start() {
        cards = []
        for i in 1...9 {
            cards.append(Card(cardState: .closed, number: i))
            cards.append(Card(cardState: .closed, number: i))
        }
        print("before:", cards)
        cards.shuffle()
        print("after:", cards)
    }
    func state(row: Int, col: Int) -> CardState {
        cards[row * 3 + col].cardState
    }
    func number(row: Int, col: Int) -> Int {
//        print(row, col, row * 3 + col + 1)
        return cards[row * 3 + col].number
    }
}
