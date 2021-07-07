//
//  ContentView.swift
//  ListApp
//
//  Created by Kiyong Kim on 2021/07/07.
//

import SwiftUI

struct Country: Identifiable {
    var id: String { name }
    var name: String
}

struct MainView: View {
    let countries = [
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
        Country(name:"Niger"),
        Country(name:"Nigeria"),
        Country(name:"Oman"),
        Country(name:"Qatar"),
        Country(name:"Saudi Arabia"),
        Country(name:"Sénégal"),
        Country(name:"Uganda"),
        Country(name:"South Africa"),
        Country(name:"Tunisie"),
    ]
    var body: some View {
        List {
            ForEach (countries) { country in
                Text(country.name)
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
