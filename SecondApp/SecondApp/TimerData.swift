//
//  TimerData.swift
//  SecondApp
//
//  Created by Kiyong Kim on 2021/07/07.
//

import Foundation

class TimerData: ObservableObject {
    @Published var timeCount = 0
    var timer: Timer?
    init() {
        timer = Timer.scheduledTimer(withTimeInterval: 1.0, repeats: true) { _ in
            self.timeCount += 1
            print("Now timeCount=\(self.timeCount)")
        }
    }
    func reset() {
        timeCount = 0
    }
}
