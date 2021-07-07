//
//  ImageStore.swift
//  AlbumsApp
//
//  Created by Kiyong Kim on 2021/07/07.
//

import Foundation
import UIKit
import SwiftUI

class ImageStore {
    static func load(strUrl: String, onDownload: @escaping (Image)->Void) -> Image {
        guard let url = URL(string: strUrl) else {
            print("Invalid URL:\(strUrl)")
            return Image(systemName: "tv.music.note")
        }
        
        NSLog("start: \(strUrl)")
        URLSession.shared.dataTask(with: url) { data, resp, err in
            var image: Image?
            if let data = data {
                if let uiImage = UIImage(data: data) {
                    image = Image(uiImage: uiImage)
                }
            }
            NSLog("end: \(strUrl)")
            onDownload(image ?? Image(systemName: "tv.music.note"))
        }.resume()

        return Image(systemName: "tv.music.note")
    }
}
