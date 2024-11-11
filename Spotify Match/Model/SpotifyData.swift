//
//  SpotifyData.swift
//  Spotify Match
//
//  Created by coni garcia on 25/08/2024.
//

import Foundation

@Observable
class SpotifyData {
    var sourcePlaylist: Playlist?
    var destinationPlaylist: Playlist?
    
    var incomplete: Bool { sourcePlaylist == nil || destinationPlaylist == nil }
}
