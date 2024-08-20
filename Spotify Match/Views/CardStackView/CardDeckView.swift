//
//  CardDeckView.swift
//  Spotify Match
//
//  Created by coni garcia on 20/08/2024.
//

import Algorithms
import SwiftUI

struct CardDeckView: View {
    @StateObject var viewModel = CardDeckViewModel()
    
    var body: some View {
        ZStack {
            ForEach(viewModel.songs.reversed().indexed(), id: \.index) { (idx, song) in
                SongCardView(song: song, deckViewModel: viewModel)
                    .zIndex(Double(idx))
                    .opacity(idx == 0 ? 0.0 : 1.0)
            }
        }
    }
}

#Preview {
    CardDeckView()
}
