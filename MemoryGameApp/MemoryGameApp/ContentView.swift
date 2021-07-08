//
//  ContentView.swift
//  MemoryGameApp
//
//  Created by Kiyong Kim on 2021/07/08.
//

import SwiftUI


struct ContentView: View {
    @ObservedObject var game = MemoryGame()
    @State var showsRestartAlert = false
    
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
                            if game.count == 0 {
                                showsRestartAlert = true
                            }
                        }
                    CardView(prefix: "f", number: card.number, count: 8, open: card.cardState == .open)
                        .gesture(gesture)
                }
            }.aspectRatio(0.5, contentMode: .fit)
            Button(action: { showsRestartAlert = true }) {
                Text("Restart game")
                    .padding(.horizontal, 30)
                    .padding(.vertical, 5)
                    .background(Capsule().stroke(lineWidth: 2.0))
            }.padding(.bottom, 10)
        }.background(
            LinearGradient(gradient: Gradient(
                            colors: [.white, .blue.opacity(0.5)]),
                           startPoint: .topLeading, endPoint: .bottomTrailing
            ).edgesIgnoringSafeArea(.all)
        ).alert(isPresented: $showsRestartAlert) {
            Alert(
                title: Text("Restart?"),
                message: Text("Do you want to restart the game?"),
                primaryButton: .default(Text("Restart")) {
                    game.start()
                },
                secondaryButton: .cancel()
            )
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
