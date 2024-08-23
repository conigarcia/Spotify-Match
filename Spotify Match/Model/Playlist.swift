//
//  Playlist.swift
//  Spotify Match
//
//  Created by coni garcia on 23/08/2024.
//

import Foundation

struct PlaylistSet: Codable {
    let limit: Int
    let next: String?
    let offset: Int
    let previous: String?
    let total: Int
    let items: [Playlist]
}

struct Playlist: Codable {
    let id: String
    let images: [PlaylistImage]
    let name: String
    let tracks: Tracks?
}

struct PlaylistImage: Codable {
    let url: String
    let width: Int?
    let height: Int?
}

struct Tracks: Codable {
    let href: String
    let total: Int
}
