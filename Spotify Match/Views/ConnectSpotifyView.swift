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
            Text("Connect to your Spotify account.")
                .fontWeight(.semibold)
                .foregroundStyle(.spotifyGreen)
            
            Button {
                if !spotifyController.appRemote.isConnected {
                    spotifyController.connect()
                }
            } label: {
                Capsule()
                    .frame(width: 250, height: 80)
                    .foregroundStyle(Color(.spotifyGreen))
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
    @State var spotifyController = SpotifyController()
    return ZStack {
        AppBackgroundView()
        ConnectSpotifyView()
    }
    .environment(spotifyController)
}
