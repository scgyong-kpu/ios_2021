//
//  CardView.swift
//  MemoryGameApp
//
//  Created by Kiyong Kim on 2021/07/09.
//

import SwiftUI

struct CardView: View {
    let prefix: String
    let number: Int
    let count: Int
    init(prefix: String, number: Int, open: Bool) {
        self.prefix = prefix
        self.number = number
        self.open = open
        count = ImageAssetHelper.count(prefix: prefix, number: number)
    }
    let open: Bool
    @State var frameIndex = 1
    var timer = Timer.publish(every: 0.1, on: .main, in: .common).autoconnect()
    var body: some View {
        Image(self.imageName)
            .resizable()
            .aspectRatio(1, contentMode: .fit)
            .onReceive(timer) { _ in
                frameIndex = frameIndex < count ? frameIndex + 1 : 1
            }
    }
    var imageName: String {
        if !open { return prefix + "_back" }
        let fidx: Int = frameIndex
        let str = prefix + String(format: "_%02d_%02d", number, fidx)
        //print(str)
        return str
    }
}

struct CardView_Previews: PreviewProvider {
    static var previews: some View {
        VStack {
            CardView(prefix: "f", number: 1, open: false)
            CardView(prefix: "f", number: 1, open: true)
            CardView(prefix: "f", number: 2, open: true)
            CardView(prefix: "f", number: 10, open: true)
        }
    }
}

struct SFSymbolPreview: PreviewProvider {
    static var previews: some View {
        List{
            ForEach(symbols, id: \.self){ symbol in
                    Image(systemName: symbol)
                        .renderingMode(.original)
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .padding(.all, 10)
            }
            .background(Color.gray)
        }
    }
}

let symbols: [String] = [
    "sun.max.fill",
     "sunrise.fill",
     "cloud.sun.rain.fill",
     "cloud.heavyrain.fill",
     "thermometer.sun.fill",
     "thermometer.snowflake",
     "exclamationmark.triangle.fill",
     "star.fill",
    "pencil.tip.crop.circle.badge.plus"
]

