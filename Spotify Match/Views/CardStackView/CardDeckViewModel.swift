//
//  CardDeckViewModel.swift
//  Spotify Match
//
//  Created by coni garcia on 20/08/2024.
//

import Foundation

final class CardDeckViewModel: ObservableObject {
    @Published var nextSongIdx = 1
    @Published var deck = [SongCardView]()
    @Published var topCardOffset = CGSize.zero
    private var topCard: SongCardView?

    init() {
        createDeck()
        getTopCard()
    }
    
    func createDeck() {
        for idx in 0...1 {
            deck.append(SongCardView(song: songSamples[idx]))
        }
    }
    
    func getTopCard() {
        topCard = deck.first!
    }
    
    func isTopCard(card: SongCardView) -> Bool {
        return card.id == topCard!.id
    }
    
    func nextCard() {
        nextSongIdx = (nextSongIdx + 1) % songSamples.count
        deck.removeFirst()
        deck.append(SongCardView(song: songSamples[nextSongIdx]))
        DispatchQueue.main.asyncAfter(deadline: DispatchTime.now() + 0.85, execute: {
            self.topCardOffset = .zero
            self.topCard = self.deck.first!
        })
    }
}

let songSamples = [
    Song(name: "BITTERSUITE", artist: "Billie Eilish", cover: "bittersuite"),
    Song(name: "Perfect Places", artist: "Lorde", cover: "melodrama"),
    Song(name: "Apple", artist: "Charlie XCX", cover: "brat")
]
