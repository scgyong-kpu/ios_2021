//
//  SecondTabView.swift
//  TabApp
//
//  Created by Kiyong Kim on 2021/07/08.
//

import SwiftUI

struct SecondTabView: View {
    var body: some View {
        NavigationView {
            List {
                Text("Row 1")
                Text("Row 1")
                Text("Row 1")
                Text("Row 1")
                Text("Row 1")
                Text("Row 1")
                Text("Row 1")
            }
        }.tabItem {
            Image(systemName: "2.circle")
            Text("Tab Two")
        }
    }
}

struct SecondTabView_Previews: PreviewProvider {
    static var previews: some View {
        SecondTabView()
    }
}
