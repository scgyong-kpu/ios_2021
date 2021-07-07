//
//  ContentView.swift
//  ListApp
//
//  Created by Kiyong Kim on 2021/07/07.
//

import SwiftUI

struct MainView: View {
    var body: some View {
        List {
            Text("Hello, world! 1")
                .padding()
            Text("Hello, world! 2")
                .padding()
            Text("Hello, world! 3")
                .padding()
            Text("Hello, world! 1")
                .padding()
            Text("Hello, world! 2")
                .padding()
            Text("Hello, world! 3")
                .padding()
            Text("Hello, world! 1")
                .padding()
            Text("Hello, world! 2")
                .padding()
            Text("Hello, world! 3")
                .padding()
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        MainView()
    }
}
