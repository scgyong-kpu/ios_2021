//
//  ContentView.swift
//  MemoryGameApp
//
//  Created by Kiyong Kim on 2021/07/08.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        VStack {
            CardView(prefix: "f", number: 1, count: 8, open: true)
            Text("Hello, world!")
                .padding()
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
