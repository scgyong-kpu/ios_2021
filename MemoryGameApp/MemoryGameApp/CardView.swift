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
    let open: Bool
    @State var frameIndex = 1
    var timer = Timer.publish(every: 0.1, on: .main, in: .common).autoconnect()
    var body: some View {
        Image(self.imageName)
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
            CardView(prefix: "f", number: 1, count: 8, open: false)
            CardView(prefix: "f", number: 1, count: 8, open: true)
            CardView(prefix: "f", number: 2, count: 8, open: true)
            CardView(prefix: "f", number: 3, count: 8, open: true)
        }
    }
}
