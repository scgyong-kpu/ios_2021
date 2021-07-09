//
//  ContentView.swift
//  MemoryGameApp
//
//  Created by Kiyong Kim on 2021/07/08.
//

import SwiftUI


struct ContentView: View {
    let prefix: String
    @ObservedObject var game = MemoryGame()
    @State var showsRestartAlert = false
    @Environment(\.presentationMode) var present
    var body: some View {
        VStack {
            HStack {
                Text("Memory Game")
                    .font(.headline)
                Spacer()
                Text("Flips: \(game.flips)")
            }
            .padding()
            GridStack(rows: MemoryGame.rows, columns: MemoryGame.cols) { row, col in
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
                    CardView(prefix: prefix, number: card.number, open:     card.cardState == .open)
                        .gesture(gesture)
                }
            }
            .aspectRatio(CGSize(width: MemoryGame.cols, height: MemoryGame.rows), contentMode: ContentMode.fit)
            Spacer()
            HStack {
                Spacer()
                Button(action: {
                    present.wrappedValue.dismiss()
                }) {
                    Text("Back")
                        .padding(.horizontal, 30)
                        .padding(.vertical, 5)
                        .background(Capsule().stroke(lineWidth: 2.0))
                }
                Spacer()
                Button(action: { showsRestartAlert = true }) {
                    Text("Restart")
                        .padding(.horizontal, 30)
                        .padding(.vertical, 5)
                        .background(Capsule().stroke(lineWidth: 2.0))
                }
                Spacer()
            }
            Spacer()
        }
        .background(
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
        .navigationBarTitle("", displayMode: .inline)
        .navigationBarBackButtonHidden(true)
        .navigationBarHidden(true)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView(prefix: "f")
    }
}
