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
    static func argb(_ argb: UInt32) -> Color {
        // argb == 0x12345678
        // a = 0x12, r = 0x34, g = 0x56, b = 0x78
        let a = Double(argb >> 24 & 0xFF) / 255.0
        let r = Double(argb >> 16 & 0xFF) / 255.0
        let g = Double(argb >> 8 & 0xFF) / 255.0
        let b = Double(argb & 0xFF) / 255.0
        return Color(.sRGB, red: r, green: g, blue: b, opacity: a)
    }
}

struct AlbumListView: View {
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
        AlbumListView()
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
                    .foregroundColor(.argb(0xFF283747))
                    .frame(height: 50)
                Text(album.artistName)
                    .font(.caption)
                    .foregroundColor(.argb(0xFF333333))
                    .lineLimit(1)
            }
        }
        //.frame(width: .infinity, height: 60, alignment: .center)
    }
    func loadAlbumImage() -> Image {
        if image != nil {
            print("Already has image for \(album.image)")
            return image!
        }
        //print("Loading \(album.image)...")
        return ImageStore.load(strUrl: album.image) { image in
            //print("Loaded: \(album.image)")
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
            AlbumCell(album: Album(albumTitle: "Some very long album title blah blah blah hello world", artistName: "A very long artist name World names jfksd fklsdj fsjd klfjdsklfj dslkjf klsdj fkldsj fklsj dklfj sklfj kldsjf klsdj kl", image: "url"))
        }
    }
}

