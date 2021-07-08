//
//  ContentView.swift
//  AnimApp
//
//  Created by Kiyong Kim on 2021/07/08.
//

import SwiftUI

struct ContentView: View {
    @State var rotation = 0.0
    @State var scale: CGFloat = 1.0
    var body: some View {
        Button(action: onBtn) {
            Text("Hit me!")
                .font(.largeTitle)
                .fontWeight(.heavy)
                .padding()
                .border(Color.black, width: 2)
                .rotationEffect(.degrees(rotation))
                //.animation(.linear(duration: 0.3))
                .animation(.spring(response: 1, dampingFraction: 0.2, blendDuration: 0))
                .scaleEffect(scale)
        }
    }
    func onBtn() {
        self.rotation = self.rotation < 360 ? self.rotation + 60 : 0
        self.scale = self.scale < 2.8  ? self.scale +  0.3 : 1
    }
}



struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
