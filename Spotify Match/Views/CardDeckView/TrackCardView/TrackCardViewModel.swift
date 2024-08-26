//
//  TrackCardViewModel.swift
//  Spotify Match
//
//  Created by coni garcia on 26/08/2024.
//

import Foundation
import SwiftUI

@Observable
final class TrackCardViewModel {
    var track: Track?
    
    func getCoverUrl() -> String {
        return track?.album.images.first?.url ?? ""
    }
    
    func getName() -> String {
        return track?.name ?? ""
    }
    
    func getArtist() -> String {
        let artists = track?.artists.map { $0.name }
        return artists?.formatted() ?? ""
    }
    
    func getColor() async -> Color {
        guard let coverUrl = URL(string: getCoverUrl()) else { return Color(.systemGroupedBackground) }
        guard let (coverData, _) = try? await URLSession.shared.data(from: coverUrl) else { return Color(.systemGroupedBackground) }
        guard let cover = UIImage(data: coverData) else { return Color(.systemGroupedBackground) }
        return Color(cover.averageColor ?? .systemGroupedBackground)
    }
}
