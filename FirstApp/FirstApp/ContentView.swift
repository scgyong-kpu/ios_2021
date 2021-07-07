//
//  ContentView.swift
//  FirstApp
//
//  Created by Kiyong Kim on 2021/07/06.
//

import SwiftUI

struct ContentView: View {
    let imageNames = [
        "cat1", "cat2", "cat3", "cat4", "cat5"
    ]
    @State var page = 3
    @State var username = ""
//    @State var showsImage = true
    @State var opacity = 0.5
    var body: some View {
        VStack {
            HStack {
                Button(action: onBtnLeft) {
                    Image("prev")
                        .resizable(resizingMode: .stretch)
                        .frame(width: 60, height: 60, alignment: .center)
                        .padding(.leading)
                }.disabled(page == 0)
                Spacer()
                Text("\(page+1)/\(imageNames.count)")
                    .font(.largeTitle)
                    .background(Color.blue)
                    .padding()
                    .border(Color.red, width: /*@START_MENU_TOKEN@*/1/*@END_MENU_TOKEN@*/)
                Spacer()
                Button(action: onBtnRight) {
                    Image("next")
                        .resizable(resizingMode: .stretch)
                        .frame(width: 60, height: 60, alignment: .center)
                        .padding(.trailing)
                }.disabled(page == imageNames.count - 1)
            }.font(.title)
            TextField("Your name", text: $username)
                .keyboardType(.phonePad)
            Text(username)
//            Toggle(isOn: $showsImage) {
//                Text("Shows Image")
//            }
            Slider(value: $opacity)
            Spacer()
            Image(imageNames[page])
                .opacity(opacity)
            Spacer()
        }
    }
    func onBtnLeft() {
        //if page == 0 { return }
        page -= 1
    }
    func onBtnRight() {
        //if page == imageNames.count - 1 { return }
        page += 1
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
