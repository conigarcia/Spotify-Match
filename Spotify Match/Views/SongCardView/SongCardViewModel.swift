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
    
    func moveSong(offset: CGSize) {
        self.offset = offset
    }
    
    func swipeSong(deckViewModel: CardDeckViewModel) {
        switch self.offset.width {
        case (-500)...(-150):
            deckViewModel.nextCard()
        case 150...500:
            deckViewModel.nextCard()
        default:
            self.offset = .zero
        }
    }
}
