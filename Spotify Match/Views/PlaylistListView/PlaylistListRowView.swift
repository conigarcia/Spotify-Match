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
                Rectangle()
                    .foregroundStyle(.separator)
            }
            .frame(width: size, height: size)
            
            Text(playlist.name)
                .font(.callout)
                .fontWeight(.medium)
                .foregroundStyle(selected ? .spotifyGreen : .white)
            
            if selected {
                Spacer()
                Image(systemName: "checkmark")
                    .font(.title3)
                    .fontWeight(.bold)
                    .foregroundStyle(.spotifyGreen)
            }
        }
    }
}

#Preview("unselected") {
    return ZStack {
        Color(.background)
            .ignoresSafeArea()
        List {
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
}

#Preview("selected") {
    return ZStack {
        Color(.background)
            .ignoresSafeArea()
        List {
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
}
