//
//  CardStackView.swift
//  Spotify Match
//
//  Created by coni garcia on 20/08/2024.
//

import SwiftUI

struct CardStackView: View {
    @StateObject var viewModel = CardStackViewModel()
    
    var body: some View {
        ZStack {
            ForEach(viewModel.songs) { song in
                SongCardView(song: song)
            }
        }
    }
}

#Preview {
    CardStackView()
}
