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
    static let rows = 5
    static let cols = 4
    var openIndex: Int?

    var count = 0
    @Published var cards: [Card] = []
    @Published var flips = 0
    
    init() {
        start()
    }
    func start() {
        cards = []
        let max_num = MemoryGame.cols * MemoryGame.rows / 2
        for i in 1...max_num {
            cards.append(Card(cardState: .closed, number: i))
            cards.append(Card(cardState: .closed, number: i))
            count += 2
        }
        cards.shuffle()
        flips = 0
    }
    func card(row: Int, col: Int) -> Card {
        cards[row * MemoryGame.cols + col]
    }
    func state(row: Int, col: Int) -> CardState {
        cards[row * MemoryGame.cols + col].cardState
    }
    func number(row: Int, col: Int) -> Int {
        return cards[row * MemoryGame.cols + col].number
    }
    func toggle(row: Int, col: Int) {
        let index = row * MemoryGame.cols + col
        let card = cards[index]
        
        if card.cardState != .closed { return }

        cards[index].cardState = .open
        guard let oidx = openIndex else {
            flips += 1
            openIndex = index
            return
        }
        let openCard = cards[oidx]
        if openCard.number != card.number {
            print("Different card: \(index) - \(oidx)")
            openIndex = index
            cards[oidx].cardState = .closed
            flips += 1
            return
        }
        remove(at: index)
        remove(at: openIndex!)
        self.openIndex = nil
    }
    func remove(at index: Int) {
        print("Removing \(index)")
        count -= 1
        cards[index].cardState = .removed
    }
}
