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
        let openCard = openIndex != nil ? cards[openIndex!] : nil
        
        let index = row * 3 + col
        var card = cards[index]
        
        switch (card.cardState) {
        case .closed:
            card.cardState = .open
            if (openCard?.number == card.number) {
                remove(at: index)
                remove(at: openIndex!)
                openIndex = nil
            }
        case .open:
            card.cardState = .closed
        default:
            break
        }
        cards[row * 3 + col] = card
    }
    func remove(at index: Int) {
        cards[index].cardState = .removed
    }
}
