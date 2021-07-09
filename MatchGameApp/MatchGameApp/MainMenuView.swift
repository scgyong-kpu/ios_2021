//
//  MainMenuView.swift
//  MatchGameApp
//
//  Created by Kiyong Kim on 2021/07/09.
//

import SwiftUI

struct MainMenuView: View {
    var body: some View {
        NavigationView {
            VStack {
                Text("Memory Game")
                    .font(.largeTitle)
                    .fontWeight(.heavy)
                    .padding()
            }
            .frame(maxWidth:.infinity, maxHeight: .infinity)
            .background(
                LinearGradient(
                    gradient: Gradient(colors: [.white, .orange.opacity(0.5)]),
                    startPoint: .topLeading, endPoint: .bottomTrailing
                ).edgesIgnoringSafeArea(.all)
            )
        }
    }
}

struct MainMenuView_Previews: PreviewProvider {
    static var previews: some View {
        MainMenuView()
    }
}
