//
//  SongCardViewModel.swift
//  Spotify Match
//
//  Created by coni garcia on 20/08/2024.
//

import Foundation
import SwiftUI

final class SongCardViewModel: ObservableObject {
    @Published var songName = String()
    @Published var songArtist = String()
    @Published var songCover = String()
    @Published var songColor: Color = .white
    
    func nextSong() {
        self.songName = "BITTERSUITE"
        self.songArtist = "Billie Eilish"
        self.songCover = "bittersuite"
        self.songColor = Color(UIImage(named: self.songCover)?.averageColor ?? .systemGroupedBackground)
    }
}
