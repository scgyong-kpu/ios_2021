//
//  MainMenuView.swift
//  MemoryGameApp
//
//  Created by Kiyong Kim on 2021/07/09.
//

import SwiftUI

extension String: Identifiable {
    public var id: String { self }
}

struct MainMenuView: View {
    let resPrefixes = [ "f", "t" ]
    var body: some View {
        VStack {
            Text("Memory Game")
                .font(.largeTitle)
                .fontWeight(.heavy)
                .padding()
            ForEach (resPrefixes) { prefix in
                Text(prefix)
            }
        }
        .frame(maxWidth:.infinity, maxHeight:.infinity)
        .background(
            LinearGradient(gradient: Gradient(
                            colors: [.white, .orange.opacity(0.5)]),
                           startPoint: .topLeading, endPoint: .bottomTrailing
            ).edgesIgnoringSafeArea(.all)
        )
    }
}

struct MainMenuView_Previews: PreviewProvider {
    static var previews: some View {
        MainMenuView()
    }
}
