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
            ForEach (Nations.continents) { continent in
                Section(header: Text(continent.region)) {
                    ForEach (continent.countries) { country in
                        Text(country.name)
                    }
                }
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        MainView()
    }
}
