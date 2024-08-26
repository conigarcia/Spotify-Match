//
//  HeaderView.swift
//  Spotify Match
//
//  Created by coni garcia on 21/08/2024.
//

import SwiftUI

struct HeaderView: View {
    @Environment(SpotifyController.self) private var spotifyController
    @Environment(SpotifyData.self) private var spotifyData
    
    @State var showingConfiguration = false
    @State var showingHelp = false
    @State var showingPlaylistSelection = false

    var body: some View {
        ZStack {
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
            .fontWeight(.bold)
            .foregroundStyle(.spotifyGreen)
            .frame(width: 360)
            .padding()
            
            if spotifyController.connected && !spotifyData.incomplete {
                SelectedPlaylistsView()
                    .onTapGesture {
                        showingPlaylistSelection.toggle()
                    }
            }
        }
        .fullScreenCover(isPresented: $showingConfiguration) {
            ConfigurationView()
        }
        .fullScreenCover(isPresented: $showingHelp) {
            HelpView()
        }
        .fullScreenCover(isPresented: $showingPlaylistSelection) {
            PlaylistSelectionView()
        }
    }
}

struct SelectedPlaylistsView: View {
    @Environment(SpotifyData.self) private var spotifyData

    @State var size = CGSize.zero
    
    @State var timer = Timer.publish(every: 10, on: .main, in: .common).autoconnect()
    @State var offset: CGFloat = 0
    @State var animation: Animation = .easeInOut(duration: 0)

    var body: some View {
        HStack {
            Text(spotifyData.originPlaylist?.name ?? "")
                .shadow(color: .shadowGreen, radius: 4)
            Image(systemName: "arrow.right")
                .fontWeight(.black)
            Text(spotifyData.destinationPlaylist?.name ?? "")
                .shadow(color: .shadowGreen, radius: 4)
        }
        .font(.body.smallCaps())
        .fontWeight(.bold)
        .foregroundStyle(.white)
        .lineLimit(1)
        .fixedSize()
        .frame(height: 40)
        .padding(.horizontal, 15)
        .background() {
            Color(.spotifyGreen)
            GeometryReader { geometry in
                Path { _ in
                    DispatchQueue.main.async {
                        size = geometry.size
                    }
                }
            }
        }
        .offset(x: offset)
        .onReceive(timer) { _ in
            withAnimation {
                offset = -offset
            }
        }
        .animation(animation, value: offset)
        .mask {
            Capsule()
                .frame(width: 200, height: 40)
        }
        .shadow(color: .black, radius: 6)
        .onChange(of: size) {
            timer = Timer.publish(every: TimeInterval((size.width * 0.015) + 1), on: .main, in: .common).autoconnect()
            animation = .easeInOut(duration: size.width * 0.015)
            offset = size.width/2 - 100
        }
        .onAppear {
            timer = Timer.publish(every: TimeInterval((size.width * 0.015) + 1), on: .main, in: .common).autoconnect()
            animation = .easeInOut(duration: size.width * 0.015)
            offset = size.width/2 - 100
        }
    }
}

#Preview("header") {
    @State var spotifyController = SpotifyController()
    @State var spotifyData = SpotifyData()
    return ZStack {
        AppBackgroundView()
        VStack {
            HeaderView()
            Spacer()
        }
    }
    .environment(spotifyController)
    .environment(spotifyData)
}

#Preview("selectedPlaylists") {
    @State var spotifyData = SpotifyData()
    spotifyData.originPlaylist = Playlist(id: "", images: [], name: "pop of english")
    spotifyData.destinationPlaylist = Playlist(id: "", images: [], name: "Tus me gusta")
    return ZStack {
        AppBackgroundView()
        SelectedPlaylistsView()
    }
    .environment(spotifyData)
}
