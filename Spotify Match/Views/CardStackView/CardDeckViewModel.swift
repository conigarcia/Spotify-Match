//
//  CardDeckViewModel.swift
//  Spotify Match
//
//  Created by coni garcia on 20/08/2024.
//

import Foundation

final class CardDeckViewModel: ObservableObject {
    @Published var nextSongIdx = 1
    // TODO: check for empty or single element songs array
    @Published var songs = songSamples[0...1]
    
    func nextSong() {
        nextSongIdx = (nextSongIdx + 1) % songSamples.count
        songs.removeFirst()
        songs.append(songSamples[nextSongIdx])
    }
}

let songSamples = [
    Song(name: "BITTERSUITE", artist: "Billie Eilish", cover: "bittersuite"),
    Song(name: "Perfect Places", artist: "Lorde", cover: "melodrama"),
    Song(name: "Apple", artist: "Charlie XCX", cover: "brat")
]
