//
//  ContentView.swift
//  ListApp
//
//  Created by Kiyong Kim on 2021/07/07.
//

import SwiftUI

extension String: Identifiable {
    public var id: String { self }
}

struct MainView: View {
    let names = [
        "Hello",
        "World",
        "Hello",
        "World",
        "Hello",
        "World",
        "Hello",
        "World",
        "Hello",
        "World",
    ]
    var body: some View {
        List {
            ForEach (names) { name in
                Text(name)
                    .padding()
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        MainView()
    }
}
