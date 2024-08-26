//
//  Spotify_MatchApp.swift
//  Spotify Match
//
//  Created by coni garcia on 20/08/2024.
//

import SwiftUI

@main
struct Spotify_MatchApp: App {
    @State private var spotifyController = SpotifyController()
    @State private var spotifyData = SpotifyData()
    
    var body: some Scene {
        WindowGroup {
            MainView()
                .onOpenURL { url in
                    spotifyController.setAccessToken(from: url)
                }
                .environment(spotifyController)
                .environment(spotifyData)
                .environment(\.colorScheme, .dark)
        }
    }
}
