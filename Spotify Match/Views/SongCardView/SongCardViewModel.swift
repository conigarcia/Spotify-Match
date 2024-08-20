//
//  SongCardViewModel.swift
//  Spotify Match
//
//  Created by coni garcia on 20/08/2024.
//

import Foundation
import SwiftUI

final class SongCardViewModel: ObservableObject {
    // Song properties
    @Published var songName = String()
    @Published var songArtist = String()
    @Published var songCover = String()
    @Published var songColor: Color = .white
    
    // ...
    @Published var offset = CGSize.zero
    
    func getNextSong() {
        self.songName = "BITTERSUITE"
        self.songArtist = "Billie Eilish"
        self.songCover = "bittersuite"
        self.songColor = Color(UIImage(named: self.songCover)?.averageColor ?? .systemGroupedBackground)
    }
    
    func swipeSong() {
        switch self.offset.width {
        case (-500)...(-150):
            self.offset = CGSize(width: -500, height: 0)
        case 150...500:
            self.offset = CGSize(width: 500, height: 0)
        default:
            self.offset = .zero
        }
    }
}
