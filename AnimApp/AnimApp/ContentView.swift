//
//  ContentView.swift
//  AnimApp
//
//  Created by Kiyong Kim on 2021/07/08.
//

import SwiftUI

struct ContentView: View {
    @State var rotation = 0.0
    var body: some View {
        Button(action: onBtn) {
            Text("Hit me!")
                .font(.largeTitle)
                .fontWeight(.heavy)
                .padding()
                .border(Color.black, width: 2)
                .rotationEffect(.degrees(rotation))
                .animation(.linear(duration: 0.3))
        }
    }
    func onBtn() {
        self.rotation = self.rotation < 360 ? self.rotation + 60 : 0
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
