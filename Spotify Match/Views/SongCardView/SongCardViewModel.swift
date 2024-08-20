//
//  SongCardViewModel.swift
//  Spotify Match
//
//  Created by coni garcia on 20/08/2024.
//

import Foundation
import SwiftUI

final class SongCardViewModel: ObservableObject {
    @Published var offset = CGSize.zero
    
    func swipeSong(deckViewModel: CardStackViewModel) {
        switch self.offset.width {
        case (-500)...(-150):
            self.offset = .zero
            deckViewModel.nextSong()
        case 150...500:
            self.offset = .zero
            deckViewModel.nextSong()
        default:
            self.offset = .zero
        }
    }
}
