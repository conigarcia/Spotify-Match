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
    @State var selectedPlaylistId: String?

    @Binding var playlist: Playlist?

    var body: some View {
        ZStack {
            Color(.background)
                .ignoresSafeArea()
            
            VStack {
                Text("Select origin playlist")
                    .font(.title3.smallCaps())
                    .fontWeight(.bold)
                    .foregroundStyle(.spotifyGreen)
                    .padding(.bottom)

                List(playlists, selection: $selectedPlaylistId) { playlist in
                    PlaylistListRowView(playlist: playlist, selected: playlist.id == selectedPlaylistId)
                        .listRowSeparator(.hidden)
                        .listRowBackground(EmptyView())
                }
                .listStyle(.plain)
            }
        }
        .navigationBarBackButtonHidden()
        .toolbar {
            Button {
                playlist = playlists.first(where: { $0.id == selectedPlaylistId })
                dismiss()
            } label: {
                Image(systemName: "checkmark.circle.fill")
                    .closeButton()
            }
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

#Preview {
    @State var spotifyController = SpotifyController()
    @State var spotifyData = SpotifyData()
    return NavigationStack {
        PlaylistListView(playlist: $spotifyData.originPlaylist)
    }
    .environment(spotifyController)
    .environment(spotifyData)
}
