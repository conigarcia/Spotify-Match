//
//  SongCardView.swift
//  Spotify Match
//
//  Created by coni garcia on 20/08/2024.
//

import SwiftUI

struct SongCardView: View, Identifiable {
    let id = UUID()
    
    let song: Song
    
    var body: some View {
        GroupBox {
            VStack(alignment: .leading) {
                Image(song.cover)
                    .resizable()
                    .scaledToFit()
                    .frame(width: 300)
                    .clipShape(.rect(cornerRadius: 10))
                Text(song.name)
                    .font(.largeTitle)
                    .fontWeight(.bold)
                    .foregroundStyle(.white)
                Text(song.artist)
                    .font(.headline)
                    .foregroundStyle(.white)
            }
            .padding()
        }
        .backgroundStyle(song.color)
    }
}

#Preview {
    SongCardView(song: songSamples[0])
}
