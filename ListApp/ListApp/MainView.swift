//
//  ContentView.swift
//  ListApp
//
//  Created by Kiyong Kim on 2021/07/07.
//

import SwiftUI

struct CountryCell: View {
    let country: Country
    var body: some View {
        NavigationLink(destination: DetailView(country: country)) {
            HStack {
                Image(country.file)
                Text(country.name)
                    .font(.subheadline)
            }
        }
    }
}

struct MainView: View {

    var body: some View {
        NavigationView {
            List {
                ForEach (Nations.continents) { continent in
                    Section(header: Text(continent.region)) {
                        ForEach (continent.countries) { country in
                            CountryCell(country: country)
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
