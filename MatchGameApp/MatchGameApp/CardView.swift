//
//  CardView.swift
//  MatchGameApp
//
//  Created by Kiyong Kim on 2021/07/09.
//

import SwiftUI

struct CardView: View {
    static let intervals = [
        "t": 20.0
    ]
    let card: Card
    let prefix: String
    let count: Int
    init(card: Card, prefix: String) {
        self.card = card
        self.prefix = prefix
        self.count = ImageAssetHelper.count(prefix: prefix, number: card.number)
        if let fps = CardView.intervals[prefix] {
            timer = Timer.publish(every: 1.0 / fps, on: .main, in: .common).autoconnect()
        }
    }
    @State var frameIndex = 1
    var timer = Timer.publish(every: 0.1, on: .main, in: .common).autoconnect()
    var body: some View {
        if let open =  card.open {
            Image(open ? String(format:"\(prefix)_%02d_%02d", card.number, frameIndex) : "\(prefix)_back")
                .resizable()
                .aspectRatio(contentMode: .fit)
                .onReceive(timer) { _ in
                    frameIndex = frameIndex < count ? frameIndex + 1 : 1
                }
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

struct AllCardsInList_Preview: PreviewProvider {
    static var previews: some View {
        List {
            HStack {
                CardView(card: Card(open: false, number: 1), prefix: "f")
                CardView(card: Card(open: false, number: 1), prefix: "t")
            }
            HStack {
                CardView(card: Card(open: nil, number: 1), prefix: "f")
                CardView(card: Card(open: nil, number: 1), prefix: "t")
            }
            ForEach (1 ... 10, id: \.self) { number in
                HStack {
                    CardView(card: Card(open: true, number: number), prefix: "f")
                    CardView(card: Card(open: true, number: number), prefix: "t")
                }
            }
        }
    }
}
