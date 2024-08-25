//
//  MainView.swift
//  Spotify Match
//
//  Created by coni garcia on 20/08/2024.
//

import SwiftUI

struct MainView: View {
    @Environment(SpotifyController.self) private var spotifyController
        
    var body: some View {
        ZStack {
            AppBackgroundView()
            VStack {
                HeaderView()
                Spacer()
                if !spotifyController.connected {
                    ConnectSpotifyView()
                } else {
                    CardDeckView()
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
    return MainView()
        .environment(spotifyController)
}
