//
//  PlaylistCardView.swift
//  Spotify Match
//
//  Created by coni garcia on 25/08/2024.
//

import SwiftUI

struct PlaylistCardView: View {
    let size: CGFloat = 160
    
    let playlist: Playlist

    var body: some View {
        GroupBox {
            AsyncImage(url: URL(string: playlist.images.first?.url ?? "")) { image in
                image.image?
                    .resizable()
                    .frame(width: size, height: size)
            }
            
            HStack {
                Text(playlist.name)
                    .font(.subheadline)
                    .fontWeight(.bold)
                    .foregroundStyle(.white)
                    .lineLimit(1)
                    .multilineTextAlignment(.leading)
                
                Spacer()
            }
            .frame(width: size)
            .padding(.vertical, 1)
        }
        .backgroundStyle(Color(.separator))
    }
}

//#Preview {
//    PlaylistCardView()
//}
