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
                VStack {
                    Image(systemName: "checkmark.circle")
                        .resizable()
                        .frame(width: 100, height: 100)
                    Text("Add song")
                        .fontWeight(.bold)
                }
                .foregroundStyle(Color(.green))
                .offset(x: -70)
                .transition(
                    .asymmetric(
                        insertion: .move(edge: .leading),
                        removal: .identity
                    )
                )
            }
            if viewModel.offset.width < -150 {
                VStack {
                    Image(systemName: "xmark.circle")
                        .resizable()
                        .frame(width: 100, height: 100)
                    Text("Dismiss song")
                        .fontWeight(.bold)
                }
                .foregroundStyle(Color(.red))
                .offset(x: 70)
                .transition(
                    .asymmetric(
                        insertion: .move(edge: .trailing),
                        removal: .identity
                    )
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
