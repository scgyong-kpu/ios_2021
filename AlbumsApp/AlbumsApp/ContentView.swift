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
    var body: some View {
        HStack {
            ImageStore.load(strUrl: album.image)
            VStack {
                Text(album.albumTitle)
                    .font(.subheadline)
                    .foregroundColor(Color.blue)
                    .multilineTextAlignment(.leading)
                Text(album.artistName)
                    .multilineTextAlignment(.leading)
            }
        }.frame(width: .infinity, height: 60, alignment: .center)
    }
}

struct AlbumCell_Previews: PreviewProvider {
    static var previews: some View {
        List {
            AlbumCell(album: Album(albumTitle: "Hello title", artistName: "Hello name", image: "url"))
            AlbumCell(album: Album(albumTitle: "Some very long album title blah blah blah hello world", artistName: "World name", image: "url"))
            AlbumCell(album: Album(albumTitle: "World title", artistName: "A very long artist name World name", image: "url"))
            AlbumCell(album: Album(albumTitle: "Some very long album title blah blah blah hello world", artistName: "A very long artist name World name", image: "url"))
        }
    }
}
