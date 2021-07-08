//
//  ContentView.swift
//  GestureApp
//
//  Created by Kiyong Kim on 2021/07/08.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        VStack {
            Image(systemName: "hand.point.right.fill")
                .font(.largeTitle)
                .padding()
                .border(Color.black, width: 2)
                .gesture(TapGesture(count: 2)
                            .onEnded { _ in
                                NSLog("tapped")
                            }
                )
                .gesture(LongPressGesture(minimumDuration: 3, maximumDistance: 5)
                            .onEnded { _ in
                                NSLog("Long pressed")
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
