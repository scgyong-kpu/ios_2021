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
    @State var visibility = false
    @State var spinning = false
    var body: some View {
        VStack {
            ZStack {
                Circle()
                    .stroke(lineWidth: 2)
                    .foregroundColor(Color.blue)
                    .frame(width: 200, height: 200, alignment: .center)
                Image(systemName: "forward.fill")
                    .font(.largeTitle)
                    .offset(y: -100)
                    .rotationEffect(.degrees(spinning ? 360 : 0))
                    .animation(.linear(duration: 5)
                                .repeatForever(autoreverses: false)
                    )
            }
            .onAppear {
                self.spinning = true
            }
            Toggle(isOn: $visibility.animation(.linear)) {
                Text("Toggle Text Views").font(.title)
            }.padding()
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
            if visibility {
                Text("Hello").font(.largeTitle)
            } else {
                Text("World").font(.largeTitle)
            }
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
