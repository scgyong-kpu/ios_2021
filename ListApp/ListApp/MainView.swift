//
//  ContentView.swift
//  ListApp
//
//  Created by Kiyong Kim on 2021/07/07.
//

import SwiftUI

struct Country: Identifiable {
    var id: String { name }
    let name: String
}

struct Continent: Identifiable {
    let region: String
    let countries: [Country]
    var id: String { region }
}

struct MainView: View {
    let continents = [
        Continent(region: "Hello Continent", countries: [
            Country(name:"Egypt"),
            Country(name:"Guinea-Bissau"),
            Country(name:"Guinée"),
            Country(name:"Guinée Equatoriale"),
            Country(name:"India"),
            Country(name:"Israel"),
            Country(name:"Jordan"),
            Country(name:"Kenya"),
            Country(name:"Kuwait"),
            Country(name:"Madagascar"),
            Country(name:"Mali"),
            Country(name:"Maroc"),
            Country(name:"Mauritius"),
            Country(name:"Mozambique"),
        ]),
        Continent(region: "World Continent", countries: [
            Country(name:"Niger"),
            Country(name:"Nigeria"),
            Country(name:"Oman"),
            Country(name:"Qatar"),
            Country(name:"Saudi Arabia"),
            Country(name:"Sénégal"),
            Country(name:"Uganda"),
            Country(name:"South Africa"),
            Country(name:"Tunisie"),
        ]),
    ]
    var body: some View {
        List {
            ForEach (continents) { continent in
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
