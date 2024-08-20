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
