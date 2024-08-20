//
//  CardStackViewModel.swift
//  Spotify Match
//
//  Created by coni garcia on 20/08/2024.
//

import Foundation

final class CardStackViewModel: ObservableObject {
    @Published var songs = [
        Song(name: "BITTERSUITE", artist: "Billie Eilish", cover: "bittersuite"),
        Song(name: "Perfect Places", artist: "Lorde", cover: "melodrama")
    ]
}
