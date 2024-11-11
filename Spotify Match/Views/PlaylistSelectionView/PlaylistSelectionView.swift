//
//  PlaylistSelectionView.swift
//  Spotify Match
//
//  Created by coni garcia on 26/08/2024.
//

import SwiftUI

struct PlaylistSelectionView: View {
    @Environment(SpotifyData.self) private var spotifyData
    
    var sourceUrl: String { spotifyData.sourcePlaylist?.images.first?.url ?? "" }
    var destinationUrl: String { spotifyData.destinationPlaylist?.images.first?.url ?? "" }
    
    @State var expanded = false

    var body: some View {
        @Bindable var spotifyData = spotifyData
        VStack {
            Spacer()
            ZStack(alignment: .bottom) {
                if expanded {
                    Rectangle()
                        .foregroundStyle((Color(.systemBackground)).opacity(0.1))
                        .frame(maxWidth: .infinity, maxHeight: .infinity)
                        .ignoresSafeArea()
                        .onTapGesture {
                            withAnimation(.spring) {
                                expanded = false
                            }
                        }
                        .transition(.opacity)
                        .zIndex(0)

                    ZStack(alignment: .center) {
                        Rectangle()
                            .foregroundStyle(Color(.systemGray3))
                            .clipShape(.rect(cornerRadius: 20))
                            .ignoresSafeArea()
                            .frame(height: 600)
                            .zIndex(1)
                        
                        VStack(spacing: 25) {
                            NavigationLink {
                                PlaylistListView(title: "Source playlist", playlist: $spotifyData.sourcePlaylist)
                            } label: {
                                PlaylistCardView(playlist: spotifyData.sourcePlaylist)
                            }

                            SpinningIcon(icon: "arrow.down")

                            NavigationLink {
                                PlaylistListView(title: "Destination playlist", playlist: $spotifyData.destinationPlaylist)
                            } label: {
                                PlaylistCardView(playlist: spotifyData.destinationPlaylist)
                            }
                        }
                        .zIndex(2)
                    }
                    .transition(.move(edge: .bottom))
                    .gesture(
                        DragGesture()
                            .onEnded { gesture in
                                if gesture.startLocation.y + 100 < gesture.location.y && abs(gesture.startLocation.x - gesture.location.x) < 100 {
                                    withAnimation(.spring) {
                                        expanded = false
                                    }
                                }
                            }
                    )
                } else {
                    ZStack(alignment: .bottom) {
                        Rectangle()
                            .foregroundStyle(Color(.systemGray3))
                            .clipShape(.rect(cornerRadius: 20))
                            .ignoresSafeArea()
                            .frame(height: 110)
                            .zIndex(3)
                        
                        HStack(spacing: 25) {
                            GroupBox {
                                AsyncImage(url: URL(string: sourceUrl)) { image in
                                    image
                                        .resizable()
                                } placeholder: {
                                    PlaylistPlaceholder()
                                }
                                .frame(width: 60, height: 60)
                            }
                            
                            SpinningIcon(icon: "arrow.right")
                            
                            GroupBox {
                                AsyncImage(url: URL(string: destinationUrl)) { image in
                                    image
                                        .resizable()
                                } placeholder: {
                                    PlaylistPlaceholder()
                                }
                                .frame(width: 60, height: 60)
                            }
                        }
                        .zIndex(4)
                    }
                    .transition(.move(edge: .bottom))
                    .onTapGesture {
                        withAnimation(.spring) {
                            expanded = true
                        }
                    }
                }
            }
        }
    }
}

#Preview {
    @Previewable @State var spotifyData = SpotifyData()
    return PlaylistSelectionView()
        .environment(spotifyData)
}
