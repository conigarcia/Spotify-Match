//
//  EmptyPlaylistSelectionView.swift
//  Spotify Match
//
//  Created by coni garcia on 25/08/2024.
//

import SwiftUI

struct EmptyPlaylistSelectionView: View {
    @State var showingPlaylistSelection = false

    var body: some View {
        Button {
            showingPlaylistSelection.toggle()
        } label: {
            Capsule()
                .frame(width: 250, height: 80)
                .foregroundStyle(Color(.spotifyGreen))
                .overlay {
                    Text("Select playlists")
                        .font(.title3.smallCaps())
                        .fontWeight(.bold)
                        .foregroundStyle(.black)
                        .padding(20)
                }
        }
        .fullScreenCover(isPresented: $showingPlaylistSelection) {
            PlaylistSelectionView()
        }
    }
}

#Preview {
    @State var spotifyData = SpotifyData()
    return EmptyPlaylistSelectionView()
        .environment(spotifyData)
}
