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
        VStack {
            HStack {
                Text("Memory Game")
                    .font(.headline)
                Spacer()
                Text("Flips: \(game.flips)")
            }
            .padding(.horizontal)
            GridStack(rows: 6, columns: 3) { row, col in
                let card = game.card(row: row, col: col)
                if card.cardState == .removed {
                    Text("Removed")
                } else {
                    let gesture = card.cardState == .open ? nil : TapGesture()
                        .onEnded { _ in
                            game.toggle(row: row, col: col)
                        }
                    CardView(prefix: "f", number: card.number, count: 8, open: card.cardState == .open)
                        .gesture(gesture)
                }
            }.aspectRatio(0.5, contentMode: .fit)
        }.background(
            LinearGradient(gradient: Gradient(
                            colors: [.white, .blue.opacity(0.5)]),
                           startPoint: .topLeading, endPoint: .bottomTrailing
            ).edgesIgnoringSafeArea(.all)
        )
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
