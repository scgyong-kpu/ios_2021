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
    static var cache = [String: Image]()
    
    static func load(strUrl: String, onDownload: @escaping (Image)->Void) -> Image {
        if let image = cache[strUrl] {
            NSLog("Using downloaded image for: \(strUrl)")
            return image
        }
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

            OperationQueue.main.addOperation {
                if image != nil {
                    cache[strUrl] = image
                }
                NSLog("end: \(strUrl)")
                onDownload(image ?? Image(systemName: "tv.music.note"))
            }
        }.resume()

        return Image(systemName: "tv.music.note")
    }
}
