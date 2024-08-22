//
//  AppBackgroundView.swift
//  Spotify Match
//
//  Created by coni garcia on 20/08/2024.
//

import SwiftUI

struct AppBackgroundView: View {
    var body: some View {
        Rectangle()
            .ignoresSafeArea()
            .foregroundStyle(Color(.background))
        
    }
}

#Preview {
    AppBackgroundView()
}
