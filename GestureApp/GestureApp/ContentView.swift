//
//  ContentView.swift
//  GestureApp
//
//  Created by Kiyong Kim on 2021/07/08.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        let tapGesture = TapGesture(count: 2)
            .onEnded { _ in
                NSLog("tapped")
            }
        let longPressGesture = LongPressGesture(minimumDuration: 3, maximumDistance: 5)
            .onEnded { _ in
                NSLog("Long pressed")
            }
        let magGesture = MagnificationGesture(minimumScaleDelta: 0)
            .onChanged { value in
                print("Mag value = \(value)")
            }
            .onEnded { value in
                NSLog("MagGesture Ended: \(value)")
            }
        return VStack {
            Image(systemName: "hand.point.right.fill")
                .font(.largeTitle)
                .padding()
                .border(Color.black, width: 2)
                .gesture(tapGesture)
                .gesture(magGesture)
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
