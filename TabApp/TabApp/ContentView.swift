//
//  ContentView.swift
//  TabApp
//
//  Created by Kiyong Kim on 2021/07/08.
//

import SwiftUI

struct ContentView: View {
    @State var selectedTabIndex = 1
    var body: some View {
        TabView(selection: $selectedTabIndex) {
            Text("Hello, world! 1")
                .tabItem {
                    Image(systemName: "1.circle")
                    Text("Tab One")
                }.tag(1)
            SecondTabView()
                .tag(2)
            Text("Hello, world! 3")
                .tabItem {
                    Image(systemName: "3.circle")
                    Text("Tab Three")
                }.tag(3)
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
