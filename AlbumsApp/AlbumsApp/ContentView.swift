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
            Image(systemName: "wifi")
            VStack {
                Text(album.albumTitle)
                    .font(.subheadline)
                    .foregroundColor(Color.blue)
                    .multilineTextAlignment(.leading)
                Text(album.artistName)
                    .multilineTextAlignment(.leading)
            }
        }
    }
}
