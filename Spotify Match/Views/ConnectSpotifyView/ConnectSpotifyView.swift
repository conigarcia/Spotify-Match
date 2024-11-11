//
//  ConnectSpotifyView.swift
//  Spotify Match
//
//  Created by coni garcia on 25/08/2024.
//

import SwiftUI

struct ConnectSpotifyView: View {
    @Environment(SpotifyController.self) private var spotifyController

    var body: some View {
        VStack {
            VStack(spacing: 10) {
                Text("Welcome!")
                    .titleText()
                    .foregroundStyle(.spotifyGreen)
                Text("Connect your Spotify account to start.")
                    .regularText()
            }
            
            Button {
                if !spotifyController.appRemote.isConnected {
                    spotifyController.connect()
                }
            } label: {
                Rectangle()
                    .frame(width: 250, height: 80)
                    .foregroundStyle(Color(.spotifyGreen))
                    .clipShape(.rect(cornerRadius: 20))
                    .overlay {
                        Image("logo_black")
                            .resizable()
                            .scaledToFit()
                            .padding(20)
                    }
            }
            .padding()
        }
    }
}

#Preview {
    @Previewable @State var spotifyController = SpotifyController()
    return ZStack {
        AppBackgroundView()
        ConnectSpotifyView()
    }
    .environment(spotifyController)
}
