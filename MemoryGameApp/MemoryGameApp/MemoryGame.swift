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
    var openIndex: Int?
    
    @Published var cards: [Card] = []
    @Published var flips = 0
    
    init() {
        start()
    }
    func start() {
        cards = []
        for i in 1...9 {
            cards.append(Card(cardState: .closed, number: i))
            cards.append(Card(cardState: .closed, number: i))
        }
        cards.shuffle()
        flips = 0
    }
    func card(row: Int, col: Int) -> Card {
        cards[row * 3 + col]
    }
    func state(row: Int, col: Int) -> CardState {
        cards[row * 3 + col].cardState
    }
    func number(row: Int, col: Int) -> Int {
//        print(row, col, row * 3 + col + 1)
        return cards[row * 3 + col].number
    }
    func toggle(row: Int, col: Int) {
        let index = row * 3 + col
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
        cards[index].cardState = .removed
    }
}
