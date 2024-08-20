//
//  SongCardView.swift
//  Spotify Match
//
//  Created by coni garcia on 20/08/2024.
//

import SwiftUI

struct SongCardView: View {
    let song: Song

    @StateObject private var viewModel = SongCardViewModel()
    @ObservedObject var deckViewModel: CardDeckViewModel
    
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
        .offset(viewModel.offset)
        .rotationEffect(.degrees(Double(viewModel.offset.width / 80)))
        .gesture(
            DragGesture()
                .onChanged{ gesture in
                    viewModel.offset = gesture.translation
                }
                .onEnded{ _ in
//                    withAnimation {
                        viewModel.swipeSong(deckViewModel: deckViewModel)
//                    }
                }
        )
    }
}

#Preview {
    @StateObject var deckViewModel = CardDeckViewModel()
    return SongCardView(
        song: Song(
            name: "BITTERSUITE",
            artist: "Billie Eilish",
            cover: "bittersuite"
        ),
        deckViewModel: deckViewModel
    )
}
