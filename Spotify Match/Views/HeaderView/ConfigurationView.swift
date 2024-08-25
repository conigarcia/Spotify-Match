//
//  ConfigurationView.swift
//  Spotify Match
//
//  Created by coni garcia on 24/08/2024.
//

import SwiftUI

struct ConfigurationView: View {
    var body: some View {
        ZStack {
            Color(.background)
                .ignoresSafeArea()

            VStack {
                Text("Configuration")
                    .font(.largeTitle.smallCaps())
                    .fontWeight(.bold)
                    .foregroundStyle(Color(.spotifyGreen))
                    .padding(.top, 25)
                
                Spacer()
            }
            .padding()
        }
    }
}

#Preview {
    return NavigationStack {
        Text("Hello, World!")
    }
    .sheet(isPresented: .constant(true)) {
        ConfigurationView()
    }    
}
