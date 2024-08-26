//
//  SpotifyData.swift
//  Spotify Match
//
//  Created by coni garcia on 25/08/2024.
//

import Foundation

@Observable class SpotifyData {
    var originPlaylist: Playlist?
    var destinationPlaylist: Playlist?
    
    var incomplete: Bool { originPlaylist == nil || destinationPlaylist == nil }
}
