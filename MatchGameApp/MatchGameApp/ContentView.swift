//
//  ContentView.swift
//  MatchGameApp
//
//  Created by Kiyong Kim on 2021/07/09.
//

import SwiftUI

struct ContentView: View {
    @ObservedObject var game = MemoryGame()
    var body: some View {
        VStack {
            HStack {
                Text("Memory Game")
                    .font(.headline)
                Spacer()
                Text("Flips: \(game.flips)")
            }
            .padding()
            GridStack(rows: MemoryGame.dimen.rows, columns: MemoryGame.dimen.cols) { row, col in
                CardView(card: game.card(row: row, col: col))
                    .gesture(TapGesture()
                                .onEnded { _ in
                                    game.toggle(row:row, col:col)
                                }
                    )
            }
            Button(action: {
                game.start()
            }) {
                Text("Restart")
                    .padding(.horizontal)
                    .padding(.vertical, 5)
                    .background(
                        Capsule().stroke(lineWidth: 2.0)
                    )
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
