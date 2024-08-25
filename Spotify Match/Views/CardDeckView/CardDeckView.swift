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
    
    @GestureState var isDragging = false
    
    var body: some View {
        ZStack {
            if viewModel.topCardOffset.width > 150 {
                SwipeEffectIcon(
                    regularIcon: "checkmark.circle",
                    specialIcon: "checkmark.circle.fill",
                    isSpecial: !isDragging,
                    text: "Add song",
                    color: .green,
                    offset: -70
                )
            }
            if viewModel.topCardOffset.width < -150 {
                SwipeEffectIcon(
                    regularIcon: "xmark.circle",
                    specialIcon: "xmark.circle.fill",
                    isSpecial: !isDragging,
                    text: "Dismiss song",
                    color: .red,
                    offset: 70
                )
            }
            
            ForEach(viewModel.deck.reversed()) { card in
                card
                    .offset(viewModel.isTopCard(card: card) ? viewModel.topCardOffset : .zero)
                    .opacity(viewModel.isTopCard(card: card) ? 1.0 : 0.0)
                    .rotationEffect(.degrees(viewModel.isTopCard(card: card) ? Double(viewModel.topCardOffset.width / 80) : 0))
                    .gesture(
                        DragGesture()
                            .updating($isDragging) { _, state, _ in
                                state = true
                            }
                            .onChanged{ gesture in
                                withAnimation {
                                    viewModel.topCardOffset = gesture.translation
                                }
                            }
                            .onEnded{ _ in
                                withAnimation {
                                    switch viewModel.topCardOffset.width {
                                    case (-500)...(-150):
                                        viewModel.nextCard()
                                    case 150...500:
                                        viewModel.nextCard()
                                    default:
                                        viewModel.topCardOffset = .zero
                                    }
                                }
                            }
                    )
                    .transition(
                        .asymmetric(
                            insertion: .identity,
                            removal: .offset(
                                x: viewModel.topCardOffset.width > 0 ? 500 : -500,
                                y: viewModel.topCardOffset.height
                            )
                        )
                    )
            }
        }
    }
}

#Preview {
    CardDeckView()
}
