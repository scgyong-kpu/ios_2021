//
//  ContentView.swift
//  MatchGameApp
//
//  Created by Kiyong Kim on 2021/07/09.
//

import SwiftUI

struct ContentView: View {
    var game = MemoryGame()
    var body: some View {
        GridStack(rows: MemoryGame.dimen.rows, columns: MemoryGame.dimen.cols) { row, col in
            CardView(card: game.card(row: row, col: col))
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
