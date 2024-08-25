//
//  ConfigurationView.swift
//  Spotify Match
//
//  Created by coni garcia on 24/08/2024.
//

import SwiftUI

struct ConfigurationView: View {
    @Environment(SpotifyController.self) private var spotifyController
    
    var body: some View {
        ZStack {
            Rectangle()
                .ignoresSafeArea()
                .foregroundStyle(Color(.background))

            VStack {
                Text("Configuration")
                    .font(.largeTitle.smallCaps())
                    .fontWeight(.bold)
                    .foregroundStyle(Color(.spotifyGreen))
                    .padding(.top, 25)
                
                Spacer()

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
                
                Spacer()
            }
            .padding()
        }
    }
}

#Preview {
    return NavigationStack {
        Text("Hello, World!")
    }
    .sheet(isPresented: .constant(true)) {
        ConfigurationView()
    }
    
}
