//
//  SecondView.swift
//  SecondApp
//
//  Created by Kiyong Kim on 2021/07/07.
//

import SwiftUI

struct SecondView: View {
    var data: String
    @ObservedObject var timerData: TimerData
    var body: some View {
        Text(data).font(.largeTitle).fontWeight(.heavy)
        Text("Timer: \(timerData.timeCount)")
            .font(.largeTitle)
            .fontWeight(.light)
    }
}

struct SecondView_Previews: PreviewProvider {
    static var previews: some View {
        SecondView(data: "Hello", timerData: TimerData())
    }
}
