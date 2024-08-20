//
//  SongCardView.swift
//  Spotify Match
//
//  Created by coni garcia on 20/08/2024.
//

import SwiftUI

struct SongCardView: View {
    @StateObject private var viewModel = SongCardViewModel()
    
    var body: some View {
        GroupBox {
            VStack(alignment: .leading) {
                Image(viewModel.songCover)
                    .resizable()
                    .scaledToFit()
                    .frame(width: 300)
                    .clipShape(.rect(cornerRadius: 10))
                Text(viewModel.songName)
                    .font(.largeTitle)
                    .fontWeight(.bold)
                    .foregroundStyle(.white)
                Text(viewModel.songArtist)
                    .font(.headline)
                    .foregroundStyle(.white)
            }
            .padding()
        }
        .backgroundStyle(viewModel.songColor)
        .offset(viewModel.offset)
        .rotationEffect(.degrees(Double(viewModel.offset.width / 80)))
        .gesture(
            DragGesture()
                .onChanged{ gesture in
                    viewModel.offset = gesture.translation
                }
                .onEnded{ _ in
                    withAnimation {
                        viewModel.swipeSong()
                    }
                }
        )
        .onAppear {
            viewModel.getNextSong()
        }
    }
}

#Preview {
    SongCardView()
}
