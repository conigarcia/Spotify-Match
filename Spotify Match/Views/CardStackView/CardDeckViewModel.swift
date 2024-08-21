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

    init() {
        createDeck()
    }
    
    func createDeck() {
        for idx in 0...1 {
            deck.append(SongCardView(song: songSamples[idx], deckViewModel: self))
        }
    }
    
    func nextCard() {
        nextSongIdx = (nextSongIdx + 1) % songSamples.count
        deck.removeFirst()
        deck.append(SongCardView(song: songSamples[nextSongIdx], deckViewModel: self))
    }
    
    func isTopCard(card: SongCardView) -> Bool {
        return card.id == deck.first?.id
    }
}

let songSamples = [
    Song(name: "BITTERSUITE", artist: "Billie Eilish", cover: "bittersuite"),
    Song(name: "Perfect Places", artist: "Lorde", cover: "melodrama"),
    Song(name: "Apple", artist: "Charlie XCX", cover: "brat")
]
