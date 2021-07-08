//
//  GridView.swift
//  MemoryGameApp
//
//  Created by Kiyong Kim on 2021/07/09.
//

import SwiftUI

struct GridStack<Content: View>: View {
    let rows: Int
    let columns: Int
    let content: (Int, Int) -> Content

    var body: some View {
        VStack {
            ForEach(0 ..< rows, id: \.self) { row in
                HStack {
                    ForEach(0 ..< self.columns, id: \.self) { column in
                        self.content(row, column)
                            .frame(maxWidth: .infinity, maxHeight: .infinity)
                    }
                }
            }
        }
    }

    //컨텐츠 클로저
    init(rows: Int, columns: Int, @ViewBuilder content: @escaping (Int, Int) -> Content) {
        self.rows = rows
        self.columns = columns
        self.content = content
    }
}

struct GridStack_Previews: PreviewProvider {
    static var previews: some View {
        GridStack(rows: 6, columns: 3) { row, column in
            Text("Row:\(row),Col:\(column)")
        }
    }
}
