//
//  EmptyPlaylistView.swift
//  Spotify Match
//
//  Created by coni garcia on 26/08/2024.
//

import SwiftUI

struct EmptyPlaylistView: View {
    @Environment(SpotifyData.self) private var spotifyData

    var body: some View {
        GroupBox {
            VStack(spacing: 20) {
                Text("Empty origin playlist.")
                    .font(.title2)
                    .fontWeight(.semibold)
                    .foregroundStyle(.white)
                    .multilineTextAlignment(.center)
                
                Text("\(spotifyData.originPlaylist!.name)")
                    .font(.title)
                    .fontWeight(.heavy)
                    .foregroundStyle(.spotifyGreen)
                    .multilineTextAlignment(.center)
                
                Text("Select a different playlist to start.")
                    .font(.headline)
                    .fontWeight(.semibold)
                    .foregroundStyle(Color(.secondaryLabel))
                    .multilineTextAlignment(.center)
            }
            .padding()
        }
    }
}

#Preview {
    @State var spotifyData = SpotifyData()
    spotifyData.originPlaylist = Playlist(id: "", images: [], name: "pop of english")
    return EmptyPlaylistView()
        .environment(spotifyData)
}
