//
//  AlbumDetailView.swift
//  AlbumsApp
//
//  Created by Kiyong Kim on 2021/07/08.
//

import SwiftUI

struct AlbumDetailView: View {
    var album: Album
    @State var image: Image?
    var body: some View {
        VStack {
            Text(album.albumTitle)
                .font(.largeTitle)
            loadAlbumImage()
                .resizable()
                .frame(width: 200, height: 200, alignment: .center)
            Text(album.artistName)
            Spacer()
        }
        .navigationBarTitle(Text(album.albumTitle), displayMode: .inline)
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

struct AlbumDetailView_Previews: PreviewProvider {
    static var previews: some View {
        AlbumDetailView(album: Album(albumTitle: "Some very long album title blah blah blah hello world", artistName: "A very long artist name World name and longer and longer", image: "http://scgyong.net/thumbs/slow.php/204_192546.jpg"))
    }
}
