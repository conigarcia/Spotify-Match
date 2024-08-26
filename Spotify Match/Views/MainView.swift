//
//  MainView.swift
//  Spotify Match
//
//  Created by coni garcia on 20/08/2024.
//

import SwiftUI

struct MainView: View {
    @Environment(SpotifyController.self) private var spotifyController
    @Environment(SpotifyData.self) private var spotifyData
    
    var body: some View {
        ZStack {
            AppBackgroundView()
            VStack {
                HeaderView()
                Spacer()
                if !spotifyController.connected {
                    ConnectSpotifyView()
                } else {
                    if spotifyData.incomplete {
                        EmptyPlaylistSelectionView()
                    } else {
                        CardDeckView()
                    }
                }
                Spacer()
                Spacer()
                    .frame(height: 40)
                    .padding()
            }
        }
    }
}

#Preview {
    @State var spotifyController = SpotifyController()
    @State var spotifyData = SpotifyData()
    return MainView()
        .environment(spotifyController)
        .environment(spotifyData)
}
