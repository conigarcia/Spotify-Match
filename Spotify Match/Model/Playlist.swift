//
//  Playlist.swift
//  Spotify Match
//
//  Created by coni garcia on 23/08/2024.
//

import Foundation

struct PlaylistSet: Codable {
//    let limit: Int
//    let next: String?
//    let offset: Int
//    let previous: String?
//    let total: Int
    let items: [Playlist]
}

struct Playlist: Codable {
    let id: String
    let images: [SpotifyImage]
    let name: String
}

struct SpotifyImage: Codable {
    let url: String
    let width: Int?
    let height: Int?
}

struct PlaylistTracks: Codable {
//    let limit: Int
//    let next: String?
//    let offset: Int
//    let previous: String?
//    let total: Int
    let items: [PlaylistTrack]
}

struct PlaylistTrack: Codable {
    let track: Track
}

struct Track: Codable {
    let name: String
    let artists: [Artist]
    let album: Album
    let previewUrl: String?
}

struct Artist: Codable {
    let name: String
}

struct Album: Codable {
    let name: String
    let images: [SpotifyImage]
}
