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
    @State var showingHelp = false
    @State var showingPlaylistSelection = false
    
//    @State var playlists = [Playlist]()

    var body: some View {
        ZStack {
            if spotifyController.connected {
                SelectedPlaylistsView()
                    .onTapGesture {
//                        Task {
//                            let playlistSet = try await getPlaylists(spotifyController: spotifyController)
//                            playlists = playlistSet.items
//                            showingPlaylistSelection.toggle()
//                        }
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
                    showingHelp.toggle()
                } label: {
                    Image(systemName: "questionmark.circle.fill")
                }
            }
            .font(.title)
            .foregroundStyle(.spotifyGreen)
            .padding()
        }
        .sheet(isPresented: $showingConfiguration) {
            ConfigurationView()
        }
        .sheet(isPresented: $showingHelp) {
            HelpView()
        }
        .sheet(isPresented: $showingPlaylistSelection) {
//            if playlists.count >= 12 {
//                PlaylistSelectionView(originPlaylist: playlists[12], destinationPlaylist: playlists[1])
//            }
        }
    }
}

struct SelectedPlaylistsView: View {
    @State var timer = Timer.publish(every: 1, on: .main, in: .common).autoconnect()
    
    @State var size = CGSize.zero
    @State var offset: CGFloat = 0

    var body: some View {
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
        .frame(height: 40)
        .padding(.horizontal, 15)
        .background(.spotifyGreen)
        .saveSize(in: $size)
        .offset(x: offset)
        .onReceive(timer) { _ in
            withAnimation {
                offset = -offset
            }
        }
        .animation(.easeInOut(duration: size.width * 0.015), value: offset)
        .mask {
            Capsule()
                .frame(width: 200, height: 40)
        }
        .onAppear {
            offset = size.width/2 - 100
            timer = Timer.publish(every: TimeInterval((size.width * 0.015) + 1), on: .main, in: .common).autoconnect()
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
