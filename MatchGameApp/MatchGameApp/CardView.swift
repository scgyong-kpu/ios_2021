//
//  CardView.swift
//  MatchGameApp
//
//  Created by Kiyong Kim on 2021/07/09.
//

import SwiftUI

struct CardView: View {
    let card: Card
    var body: some View {
        if let open =  card.open {
            Image(open ? String(format:"f_%02d_01", card.number) : "f_back")
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
        VStack {
            CardView(card: Card(open: false, number: 1))
            CardView(card: Card(open: nil, number: 1))
            CardView(card: Card(open: true, number: 1))
            CardView(card: Card(open: true, number: 2))
        }
    }
}
