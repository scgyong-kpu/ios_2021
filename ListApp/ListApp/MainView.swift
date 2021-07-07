//
//  ContentView.swift
//  ListApp
//
//  Created by Kiyong Kim on 2021/07/07.
//

import SwiftUI

struct MainView: View {

    var body: some View {
        NavigationView {
            List {
                ForEach (Nations.continents) { continent in
                    Section(header: Text(continent.region)) {
                        ForEach (continent.countries) { country in
                            NavigationLink(destination: Text(country.name)) {
                                HStack {
                                    Image(country.file)
                                    Text(country.name)
                                        .font(.subheadline)
                                }
                            }
                        }
                    }
                }
            }
            .navigationBarTitle(Text("Countries"))
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        MainView()
    }
}
