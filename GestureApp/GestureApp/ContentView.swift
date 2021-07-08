//
//  ContentView.swift
//  GestureApp
//
//  Created by Kiyong Kim on 2021/07/08.
//

import SwiftUI

struct ContentView: View {
    @State var magnification = CGFloat(1.0)
    @GestureState var offset = CGSize.zero
    @State var dragEnabled = false
    
    var body: some View {
//        let tapGesture = TapGesture(count: 2)
//            .onEnded { _ in
//                NSLog("tapped")
//            }
//        let longPressGesture = LongPressGesture(minimumDuration: 3, maximumDistance: 5)
//            .onEnded { _ in
//                NSLog("Long pressed")
//            }
//        let magGesture = MagnificationGesture(minimumScaleDelta: 0)
//            .onChanged { value in
//                print("Mag value = \(value)")
//                self.magnification = value
//            }
//            .onEnded { value in
//                NSLog("MagGesture Ended: \(value)")
//            }
//        let dragGesture = DragGesture()
//            .updating($offset) { dv, state, transaction in
//                state = dv.translation
//            }
        let lpAndDrag = LongPressGesture(minimumDuration: 1.0)
            .onEnded { _ in
                self.dragEnabled = true
                print("drag enabled")
            }
            .sequenced(before: DragGesture())
            .updating($offset) { value, state, transaction in
                switch value {
                case .first(true):
                    NSLog("Long press in progress")
                case .second(true, let drag):
                    state = drag?.translation ?? .zero
                default: break
                }
            }
            .onEnded { _ in
                self.dragEnabled = false
            }
        return VStack {
            Image(systemName: "hand.point.right.fill")
                .foregroundColor(dragEnabled ? .green : .blue)
                .font(.largeTitle)
                .padding()
                .border(Color.black, width: 2)
                .scaleEffect(magnification)
                .offset(offset)
                //.gesture(tapGesture)
                //.gesture(magGesture)
                .gesture(lpAndDrag)
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
