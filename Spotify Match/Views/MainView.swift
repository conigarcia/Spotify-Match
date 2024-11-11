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
    
    @State var showingConfiguration = false
    @State var showingHelp = false
    
    var body: some View {
        NavigationStack {
            ZStack {
                AppBackgroundView()
                
                if !spotifyController.connected {
                    ConnectSpotifyView()
                } else {
                    VStack {
                        Spacer()
                        
                        if spotifyData.originPlaylist == nil {
                            EmptyCardView(text: "Select origin playlist.")
                        } else if spotifyData.destinationPlaylist == nil {
                            EmptyCardView(text: "Select destination playlist.")
                        } else {
                            CardDeckView()
                        }
                        
                        Spacer()
                        Spacer()
                            .frame(height: 110)
                    }
                    
                    PlaylistSelectionView()
                }
                
            }
            .toolbar {
                ToolbarItem(placement: .topBarLeading) {
                    Button {
                        showingConfiguration.toggle()
                    } label: {
                        Image(systemName: "gearshape.circle.fill")
                            .toolbarButton()
                    }
                }
                
                ToolbarItem(placement: .topBarTrailing) {
                    Button {
                        showingHelp.toggle()
                    } label: {
                        Image(systemName: "questionmark.circle.fill")
                            .toolbarButton()
                    }
                }
            }
            .fullScreenCover(isPresented: $showingConfiguration) {
                ConfigurationView()
            }
            .fullScreenCover(isPresented: $showingHelp) {
                HelpView()
            }
        }
    }
}

#Preview {
    @Previewable @State var spotifyController = SpotifyController()
    @Previewable @State var spotifyData = SpotifyData()
    return MainView()
        .environment(spotifyController)
        .environment(spotifyData)
}
