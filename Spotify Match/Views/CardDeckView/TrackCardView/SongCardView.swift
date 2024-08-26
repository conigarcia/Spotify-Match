//
//  SongCardView.swift
//  Spotify Match
//
//  Created by coni garcia on 20/08/2024.
//

import SwiftUI

struct SongCardView: View, Identifiable {
    let id = UUID()
    let size: CGFloat = 300
    
    let song: Song
    
    var body: some View {
        GroupBox {
            VStack(alignment: .leading) {
                Image(song.cover)
                    .resizable()
                    .scaledToFit()
                    .frame(width: size)

                HStack {
                    Text(song.name)
                        .font(.largeTitle)
                        .fontWeight(.bold)
                        .scaledToFit()
                        .minimumScaleFactor(0.6)
                        .foregroundStyle(.white)
                        .lineLimit(1)
                    Spacer()
                }
                .frame(width: size)

                Text(song.artist)
                    .font(.headline)
                    .foregroundStyle(.white)
                    .lineLimit(1)
            }
            .padding()
        }
        .backgroundStyle(song.color)
    }
}

#Preview {
    SongCardView(song: songSamples[0])
}
