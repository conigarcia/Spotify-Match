//
//  CloseButton.swift
//  Spotify Match
//
//  Created by coni garcia on 25/08/2024.
//

import SwiftUI

struct CloseButton: ViewModifier {
    func body(content: Content) -> some View {
        content
            .font(.title2)
            .fontWeight(.bold)
            .foregroundStyle(.spotifyGreen)
    }
}

extension View {
    func closeButton() -> some View {
        modifier(CloseButton())
    }
}
