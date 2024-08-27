//
//  PlaylistPlaceholder.swift
//  Spotify Match
//
//  Created by coni garcia on 27/08/2024.
//

import SwiftUI

struct PlaylistPlaceholder: View {
    var body: some View {
        Rectangle()
            .foregroundStyle(Color(.systemGray5))
            .overlay {
                Image(systemName: "questionmark")
                    .fontWeight(.bold)
                    .foregroundStyle(Color(.secondaryLabel))
            }
    }
}

#Preview {
    PlaylistPlaceholder()
        .frame(width: 100, height: 100)
}
