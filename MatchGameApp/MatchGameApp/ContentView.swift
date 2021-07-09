//
//  ContentView.swift
//  MatchGameApp
//
//  Created by Kiyong Kim on 2021/07/09.
//

import SwiftUI

struct ContentView: View {
    let prefix: String
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
            .padding()
            GridStack(rows: MemoryGame.dimen.rows, columns: MemoryGame.dimen.cols) { row, col in
                CardView(card: game.card(row: row, col: col))
                    .gesture(TapGesture()
                                .onEnded { _ in
                                    game.toggle(row:row, col:col)
                                }
                    )
            }
            .aspectRatio(CGSize(width: MemoryGame.dimen.cols, height: MemoryGame.dimen.rows), contentMode: .fit)
            Button(action: {
                showsRestartAlert = true
            }) {
                Text("Restart")
                    .padding(.horizontal)
                    .padding(.vertical, 5)
                    .background(
                        Capsule().stroke(lineWidth: 2.0)
                    )
            }
        }
        .background(
            LinearGradient(
                gradient: Gradient(
                    colors: [.white, .blue.opacity(0.5)]),
                startPoint: .topLeading,
                endPoint: .trailing
            ).edgesIgnoringSafeArea(.all)
        )
        .alert(isPresented: $showsRestartAlert) {
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
        .navigationBarHidden(true)
        .navigationBarBackButtonHidden(true)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView(prefix: "f")
    }
}
