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
                if viewModel.topCardOffset.width > 150 {
                    SwipeEffectIcon(
                        icon: "checkmark.circle",
                        text: "Add song",
                        color: .green,
                        offset: -70
                    )
                    .transition(
                        .asymmetric(
                            insertion: .move(edge: .leading),
                            removal: .identity
                        )
                    )
                }
                if viewModel.topCardOffset.width < -150 {
                    SwipeEffectIcon(
                        icon: "xmark.circle",
                        text: "Dismiss song",
                        color: .red,
                        offset: 70
                    )
                    .transition(
                        .asymmetric(
                            insertion: .move(edge: .trailing),
                            removal: .identity
                        )
                    )
                }
                
                card
                    .offset(viewModel.isTopCard(card: card) ? viewModel.topCardOffset : .zero)
                    .opacity(viewModel.isTopCard(card: card) ? 1.0 : 0.0)
                    .rotationEffect(.degrees(viewModel.isTopCard(card: card) ? Double(viewModel.topCardOffset.width / 80) : 0))
                    .gesture(
                        DragGesture()
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
                                        viewModel.topCardOffset = .zero
                                    case 150...500:
                                        viewModel.nextCard()
                                        viewModel.topCardOffset = .zero
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
                    .animation(.linear(duration: 0.05).delay(0.5), value: viewModel.isTopCard(card: card))
            }
        }
    }
}

#Preview {
    CardDeckView()
}
