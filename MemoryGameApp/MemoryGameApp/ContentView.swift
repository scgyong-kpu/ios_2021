//
//  ContentView.swift
//  MemoryGameApp
//
//  Created by Kiyong Kim on 2021/07/08.
//

import SwiftUI


struct ContentView: View {
    @ObservedObject var game = MemoryGame()
    
    var body: some View {
        GridStack(rows: 6, columns: 3) { row, col in
            CardView(prefix: "f", number: game.number(row: row, col: col), count: 8, open: game.state(row: row, col: col) == .open)
                .gesture(TapGesture()
                            .onEnded { _ in
                                game.toggle(row: row, col: col)
                            }
                )
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
