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
    let resPrefixes = [ "f", "f" ]
    var body: some View {
        NavigationView {
            VStack {
//                
//                    .font(.largeTitle)
//                    .fontWeight(.heavy)
//                    .padding()
                ScrollView(.vertical, showsIndicators: false) {
                    VStack(spacing: 10) {
                        ForEach (resPrefixes) { prefix in
                            MenuItem(prefix: prefix)
                        }
                    }
                    .padding(.bottom)
                }
            }
            .frame(maxWidth:.infinity, maxHeight:.infinity)
            .background(
                LinearGradient(gradient: Gradient(
                                colors: [.white, .orange.opacity(0.5)]),
                               startPoint: .topLeading, endPoint: .bottomTrailing
                ).edgesIgnoringSafeArea(.all)
            )
            .navigationBarTitle(Text("Memory Game"))
        }
    }
}

struct MenuItem: View {
    let prefix: String
    var body: some View {
        HStack {
            Image("\(prefix)_01_01")
                .resizable()
                .frame(width: UIScreen.main.bounds.width * 0.4, height: UIScreen.main.bounds.width * 0.4 )
                .padding(.leading)
            Spacer()
            NavigationLink(destination:ContentView(prefix: prefix)) {
                Text("Play Game")
                    .lineLimit(1)
                    .padding()
                    .background(
                        Capsule()
                            .stroke(lineWidth: 4.0)
                    )
            }
            Spacer()
        }.frame(height: 240)
        .background(
            ZStack {
                Color.white.opacity(0.2)
                    .cornerRadius(25)
                    .padding(20)
                Image("\(prefix)_bg")
                    .resizable()
                    .padding(50)
                    .opacity(0.2)
            }
            .rotation3DEffect(
                .degrees(20),
                axis: (x: 0.0, y: -1.0, z: 0.0)
            )
        )
    }
}

struct MainMenuView_Previews: PreviewProvider {
    static var previews: some View {
        MainMenuView()
    }
}

