//
//  Spotify_MatchApp.swift
//  Spotify Match
//
//  Created by coni garcia on 20/08/2024.
//

import SwiftUI

@main
struct Spotify_MatchApp: App {
    @StateObject private var spotifyController = SpotifyController()
    
    var body: some Scene {
        WindowGroup {
            MainView()
                .onOpenURL { url in
                    spotifyController.setAccessToken(from: url)
                }
                .onReceive(NotificationCenter.default.publisher(for: UIApplication.didFinishLaunchingNotification), perform: { _ in
                    spotifyController.connect()
                })
                .environmentObject(spotifyController)
        }
    }
}
