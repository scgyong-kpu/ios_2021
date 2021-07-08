//
//  AlbumStore.swift
//  AlbumsApp
//
//  Created by Kiyong Kim on 2021/07/07.
//

import Foundation
struct Album: Codable {
    var albumTitle: String
    var artistName: String
    var image: String
}
struct AlbumData: Codable {
    var albums: [Album]
}
class AlbumStore: ObservableObject {
    static let singleton = AlbumStore()
    @Published var albums = [Album]()
    func load() {
        guard let url = Bundle.main.url(forResource: "res/albums.json", withExtension: "") else {
            print("albums.json not found !!")
            return
        }
        print("Loading from: \(url)...")
        guard let data = try? Data(contentsOf: url) else {
            print("Could not read from \(url)")
            return
        }
        let decoder = JSONDecoder()
        guard let albumData = try? decoder.decode(AlbumData.self, from: data) else {
            print("Decode failed")
            return
        }
        self.albums = albumData.albums
        print("Loaded Albums: \(albums.count)")
    }
}
