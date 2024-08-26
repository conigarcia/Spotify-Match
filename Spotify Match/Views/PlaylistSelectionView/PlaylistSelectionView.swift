//
//  PlaylistSelectionView.swift
//  Spotify Match
//
//  Created by coni garcia on 24/08/2024.
//

import SwiftUI

struct PlaylistSelectionView: View {
    @Environment(\.dismiss) private var dismiss
    @Environment(SpotifyData.self) private var spotifyData
    
    var body: some View {
        @Bindable var spotifyData = spotifyData
        NavigationStack {
            ZStack {
                Color(.background)
                    .ignoresSafeArea()
                
                VStack {
                    
                    Text("Select origin playlist")
                        .modifier(SmallTitle())
                    
                    NavigationLink {
                        PlaylistListView(playlist: $spotifyData.originPlaylist)
                    } label: {
                        PlaylistCardView(playlist: spotifyData.originPlaylist)
                    }
                    
                    Spacer()
                        .frame(height: 70)
                    
                    Text("Select destination playlist")
                        .modifier(SmallTitle())
                    
                    NavigationLink {
                        PlaylistListView(playlist: $spotifyData.destinationPlaylist)
                    } label: {
                        PlaylistCardView(playlist: spotifyData.destinationPlaylist)
                    }
                }
            }
            .toolbar {
                Button {
                    dismiss()
                } label: {
                    Image(systemName: "xmark.circle.fill")
                        .closeButton()
                }
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

#Preview {
    @State var spotifyData = SpotifyData()
    return PlaylistSelectionView()
        .environment(spotifyData)
}
