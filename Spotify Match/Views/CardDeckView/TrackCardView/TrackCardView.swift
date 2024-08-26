//
//  TrackCardView.swift
//  Spotify Match
//
//  Created by coni garcia on 20/08/2024.
//

import SwiftUI

struct TrackCardView: View, Identifiable {
    @State private var viewModel = TrackCardViewModel()
    
    let id = UUID()
    let size: CGFloat = 300
    @State var color = Color(.systemBackground)
    
    let track: Track
    
    var body: some View {
        GroupBox {
            VStack(alignment: .leading) {
                AsyncImage(url: URL(string: viewModel.getCoverUrl())) { image in
                    image
                        .resizable()
                        .scaledToFit()
                } placeholder: {
                    EmptyView()
                }
                .frame(width: size, height: size)
                
                HStack {
                    Text(viewModel.getName())
                        .font(.largeTitle)
                        .fontWeight(.bold)
                        .scaledToFit()
                        .minimumScaleFactor(0.6)
                        .foregroundStyle(.white)
                        .lineLimit(1)
                    Spacer()
                }
                .frame(width: size)
                
                HStack {
                    Text(viewModel.getArtist())
                        .font(.headline)
                        .foregroundStyle(.white)
                        .lineLimit(1)
                    Spacer()
                }
                .frame(width: size)
            }
            .padding()
        }
        .backgroundStyle(color)
        .onAppear {
            viewModel.track = track
        }
        .task {
            color = await viewModel.getColor()
        }
    }
}

#Preview {
    return ZStack {
        AppBackgroundView()
        TrackCardView(
            track: Track(
                name: "BITTERSUITE",
                artists: [Artist(name: "Billie Eilish")],
                album: Album(name: "HIT ME HARD AND SOFT", images: []),
                previewUrl: nil
            )
        )
    }
}
