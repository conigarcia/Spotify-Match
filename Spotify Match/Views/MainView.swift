//
//  MainView.swift
//  Spotify Match
//
//  Created by coni garcia on 20/08/2024.
//

import SwiftUI

struct MainView: View {
    var body: some View {
        ZStack {
            AppBackgroundView()
            VStack {
                HeaderView()
                Spacer()
                CardDeckView()
                Spacer()
                Spacer()
                    .frame(height: 40)
                    .padding()
            }
        }
    }
}

#Preview {
    MainView()
}
