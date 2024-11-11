//
//  PlaylistListView.swift
//  Spotify Match
//
//  Created by coni garcia on 26/08/2024.
//

import SwiftUI

struct PlaylistListView: View {
    @Environment(SpotifyController.self) private var spotifyController
    @Environment(\.dismiss) private var dismiss
    
    @State var playlists = [Playlist]()
    @State var selectedPlaylist: Playlist?
    
    let title: String
    @Binding var playlist: Playlist?
    
    var body: some View {
        VStack {
            Text(title)
                .font(.title3)
                .fontWeight(.bold)
                .foregroundStyle(.spotifyGreen)
            
            List(playlists) { playlist in
                PlaylistListRowView(playlist: playlist, selected: playlist.id == selectedPlaylist?.id)
                    .listRowSeparator(.hidden)
                    .listRowBackground(EmptyView())
                    .onTapGesture {
                        if playlist.id == selectedPlaylist?.id {
                            selectedPlaylist = nil
                        } else {
                            selectedPlaylist = playlist
                        }
                    }
            }
            .listStyle(.plain)
        }
        .navigationBarBackButtonHidden()
        .toolbar {
            Button {
                playlist = selectedPlaylist
                dismiss()
            } label: {
                Image(systemName: "checkmark.circle.fill")
                    .toolbarButton()
            }
            .task {
                do {
                    let playlistSet = try await getPlaylists(spotifyController: spotifyController)
                    playlists = playlistSet.items
                } catch NetworkError.invalidURL {
                    print("getPlaylists - invalid URL")
                } catch NetworkError.invalidResponse {
                    print("getPlaylists - invalid response")
                } catch NetworkError.invalidData {
                    print("getPlaylists - invalid data")
                } catch {
                    print("getPlaylists - unexpected error")
                }
            }
        }
    }
}

#Preview {
    @Previewable @State var spotifyController = SpotifyController()
    @Previewable @State var spotifyData = SpotifyData()
    return NavigationStack {
        PlaylistListView(title: "Source playlist", playlist: $spotifyData.sourcePlaylist)
    }
    .environment(spotifyController)
    .environment(spotifyData)
}
