//
//  HeaderView.swift
//  Spotify Match
//
//  Created by coni garcia on 21/08/2024.
//

import SwiftUI

struct HeaderView: View {
    @Environment(SpotifyController.self) private var spotifyController
    
    @State var showingConfiguration = false
//    @State var showingHelp = false
    @State var showingPlaylistSelection = false
    
    @State var playlists = [Playlist]()

    let timer = Timer.publish(every: 9, on: .main, in: .common).autoconnect()
    @State var offset: CGFloat = -250
    
    var body: some View {
        ZStack {
            HStack {
                Text("pop of english")
                Image(systemName: "arrow.right")
                    .fontWeight(.black)
                Text("Tus me gusta")
            }
            .font(.body.smallCaps())
            .fontWeight(.bold)
            .lineLimit(1)
            .fixedSize()
            .foregroundStyle(.black)
            .frame(width: 700, height: 40)
            .background(Color(.spotifyGreen))
            .offset(x: offset)
            .onReceive(timer) { _ in
                withAnimation {
                    offset = -offset
                    DispatchQueue.main.asyncAfter(deadline: DispatchTime.now() + 0.5, execute: {
                        offset = -offset
                    })
                }
            }
            .animation(offset < 0 ? .linear(duration: 8) : .none, value: offset)
            .padding()
            .mask {
                Capsule()
                    .frame(width: 200, height: 40)
            }
            .onTapGesture {
                Task {
                    let playlistSet = try await getPlaylists(spotifyController: spotifyController)
                    playlists = playlistSet.items
                    showingPlaylistSelection.toggle()
                }
            }
            
            HStack(alignment: .center) {
                Button {
                    showingConfiguration.toggle()
                } label: {
                    Image(systemName: "gearshape.circle.fill")
                }
                
                Spacer()
                
                Button {
                    
                } label: {
                    Image(systemName: "questionmark.circle.fill")
                }
            }
            .font(.title)
            .foregroundStyle(Color(.spotifyGreen))
            .frame(width: 350)
            .padding()
        }
        .sheet(isPresented: $showingConfiguration) {
            ConfigurationView()
        }
        .sheet(isPresented: $showingPlaylistSelection) {
            if playlists.count >= 12 {
                PlaylistSelectionView(originPlaylist: playlists[12], destinationPlaylist: playlists[1])
            }
        }
    }
}

#Preview {
    @State var spotifyController = SpotifyController()
    return ZStack {
        AppBackgroundView()
        VStack {
            HeaderView()
            Spacer()
        }
        .environment(spotifyController)
    }
}
