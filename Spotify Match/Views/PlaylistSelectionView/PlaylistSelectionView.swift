//
//  PlaylistSelectionView.swift
//  Spotify Match
//
//  Created by coni garcia on 24/08/2024.
//

import SwiftUI

struct PlaylistSelectionView: View {
    let originPlaylist: Playlist
    let destinationPlaylist: Playlist

    var body: some View {
        ZStack {
            Color(.background)
                .ignoresSafeArea()

            VStack {

                Text("Select origin playlist")
                    .smallTitle()

                PlaylistCardView(playlist: originPlaylist)

                Spacer()
                    .frame(height: 70)

                Text("Select destination playlist")
                    .smallTitle()

                PlaylistCardView(playlist: destinationPlaylist)
            }
        }
    }
}

struct SmallTitle: ViewModifier {
    func body(content: Content) -> some View {
        content
            .font(.body.smallCaps())
            .fontWeight(.bold)
            .foregroundStyle(.spotifyGreen)
    }
}

extension View {
    func smallTitle() -> some View {
        modifier(SmallTitle())
    }
}

//#Preview {
//    PlaylistSelectionView()
//}
