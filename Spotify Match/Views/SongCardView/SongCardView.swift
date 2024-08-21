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
    
    @StateObject private var viewModel = SongCardViewModel()
    @ObservedObject var deckViewModel: CardDeckViewModel
    
    var body: some View {
        ZStack {
            if viewModel.offset.width > 150 {
                SwipeEffectIcon(
                    icon: "checkmark.circle",
                    text: "Add song",
                    color: .green,
                    offset: -70
                )
            }
            if viewModel.offset.width < -150 {
                SwipeEffectIcon(
                    icon: "xmark.circle",
                    text: "Dismiss song",
                    color: .red,
                    offset: 70
                )
            }
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
                        withAnimation {
                            viewModel.moveSong(offset: gesture.translation)
                        }
                    }
                    .onEnded{ _ in
                        withAnimation {
                            viewModel.swipeSong(deckViewModel: deckViewModel)
                        }
                    }
            )
        }
        .transition(
            .asymmetric(
                insertion: .identity,
                removal: .offset(
                    x: viewModel.offset.width > 0 ? 500 : -500,
                    y: viewModel.offset.height
                )
            )
        )
    }
}

#Preview {
    @StateObject var deckViewModel = CardDeckViewModel()
    return SongCardView(song: songSamples[0], deckViewModel: deckViewModel)
}
