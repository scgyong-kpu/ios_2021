//
//  ContentView.swift
//  AlbumsApp
//
//  Created by Kiyong Kim on 2021/07/07.
//

import SwiftUI

extension Album: Identifiable {
    var id: String { albumTitle }
}

extension Color {
    static func argb(_ argb:UInt32) -> Color {
        let a = argb >> 24 & 0xFF
        let r = argb >> 16 & 0xFF
        let g = argb >> 8 & 0xFF
        let b = argb & 0xFF
        var color = Color(
            red: Double(r) / 255.0,
            green: Double(g) / 255.0,
            blue: Double(b) / 255.0
        )
        if a != 255 {
            color = color.opacity(Double(a) / 255.0)
        }
        return color
    }
}

struct ContentView: View {
    var body: some View {
        List {
            ForEach (AlbumStore.singleton.albums) { album in
                AlbumCell(album: album)
            }
        }
        Text("Hello, world! \(AlbumStore.singleton.albums.count)")
            .padding()
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

struct AlbumCell: View {
    let album: Album
    @State var image: Image?
    var body: some View {
        HStack {
            loadAlbumImage()
                .resizable()
                .frame(width: 56, height: 56, alignment: .center)
            VStack(alignment: .leading) {
                Text(album.albumTitle)
                    .font(.headline)
                    .foregroundColor(.argb(0xff154360))
                    .frame(height: 50)
                Text(album.artistName)
                    .font(.caption)
                    .foregroundColor(.argb(0xff333333))
                    .lineLimit(1)
            }
        }
        //.frame(width: .infinity, height: 60, alignment: .center)
    }
    func loadAlbumImage() -> Image {
        if image != nil { return image! }
        print("Loading \(album.image)...")
        return ImageStore.load(strUrl: album.image) { image in
            print("Loaded: \(album.image)")
            self.image = image
        }
    }
}

struct AlbumCell_Previews: PreviewProvider {
    static var previews: some View {
        List {
            AlbumCell(album: Album(albumTitle: "Hello title", artistName: "Hello name", image: "url"))
            AlbumCell(album: Album(albumTitle: "Some very long album title blah blah blah hello world", artistName: "World name", image: "url"))
            AlbumCell(album: Album(albumTitle: "World title", artistName: "A very long artist name World name", image: "url"))
            AlbumCell(album: Album(albumTitle: "Some very long album title blah blah blah hello world", artistName: "A very long artist name World name and longer and longer", image: "http://scgyong.net/thumbs/slow.php/204_192546.jpg"))
        }
    }
}
