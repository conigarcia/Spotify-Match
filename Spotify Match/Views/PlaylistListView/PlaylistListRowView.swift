//
//  PlaylistListRowView.swift
//  Spotify Match
//
//  Created by coni garcia on 26/08/2024.
//

import SwiftUI

struct PlaylistListRowView: View {
    var size: CGFloat = 65

    let playlist: Playlist
    let selected: Bool

    var body: some View {
        HStack(spacing: 15) {
            AsyncImage(url: URL(string: playlist.images.first?.url ?? "")) { image in
                image
                    .resizable()
            } placeholder: {
                PlaylistPlaceholder()
            }
            .frame(width: size, height: size)
            
            Text(playlist.name)
                .font(.callout)
                .fontWeight(.semibold)
                .foregroundStyle(selected ? .spotifyGreen : Color(.label))
            
            Spacer()

            if selected {
                Image(systemName: "checkmark")
                    .font(.title3)
                    .fontWeight(.bold)
                    .foregroundStyle(.spotifyGreen)
            }
        }
        .frame(maxWidth: .infinity)
    }
}

#Preview("unselected") {
    return List {
        PlaylistListRowView(
            playlist: Playlist(id: "", images: [], name: "pop of english"),
            selected: false
        )
        .listRowSeparator(.hidden)
        .listRowBackground(EmptyView())
    }
    .listStyle(.plain)
    .padding(.top)
}

#Preview("selected") {
    return List {
        PlaylistListRowView(
            playlist: Playlist(id: "", images: [], name: "pop of english"),
            selected: true
        )
        .listRowSeparator(.hidden)
        .listRowBackground(EmptyView())
    }
    .listStyle(.plain)
    .padding(.top)
}
