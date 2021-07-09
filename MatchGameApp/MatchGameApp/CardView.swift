//
//  CardView.swift
//  MatchGameApp
//
//  Created by Kiyong Kim on 2021/07/09.
//

import SwiftUI

struct CardView: View {
    let card: Card
    let prefix: String
    var body: some View {
        if let open =  card.open {
            Image(open ? String(format:"\(prefix)_%02d_01", card.number) : "\(prefix)_back")
                .resizable()
                .aspectRatio(contentMode: .fit)
        } else {
            Image(systemName: "x.circle")
                .resizable()
                .aspectRatio(contentMode: .fit)
                .opacity(0.1)
        }
    }
}

struct CardView_Previews: PreviewProvider {
    static var previews: some View {
        HStack {
            VStack {
                CardView(card: Card(open: false, number: 1), prefix: "f")
                CardView(card: Card(open: nil, number: 1), prefix: "f")
                CardView(card: Card(open: true, number: 1), prefix: "f")
                CardView(card: Card(open: true, number: 2), prefix: "f")
            }
            VStack {
                CardView(card: Card(open: false, number: 1), prefix: "t")
                CardView(card: Card(open: nil, number: 1), prefix: "t")
                CardView(card: Card(open: true, number: 1), prefix: "t")
                CardView(card: Card(open: true, number: 2), prefix: "t")
            }
        }
    }
}
