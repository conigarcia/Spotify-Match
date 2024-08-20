//
//  Song.swift
//  Spotify Match
//
//  Created by coni garcia on 20/08/2024.
//

import Foundation
import SwiftUI

final class Song {
    let name: String
    let artist: String
    let cover: String
    let color: Color
    
    init(name: String, artist: String, cover: String) {
        self.name = name
        self.artist = artist
        self.cover = cover
        self.color = Color(UIImage(named: self.cover)?.averageColor ?? .systemGroupedBackground)
    }
}
