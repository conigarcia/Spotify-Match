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
            ForEach(viewModel.deck.reversed()) { card in
                card
                    .opacity(viewModel.isTopCard(card: card) ? 1.0 : 0.0)
                    .animation(.linear(duration: 0.05).delay(0.5), value: viewModel.isTopCard(card: card))
            }
        }
    }
}

#Preview {
    CardDeckView()
}
