//
//  ConfigurationView.swift
//  Spotify Match
//
//  Created by coni garcia on 24/08/2024.
//

import SwiftUI

struct ConfigurationView: View {
    @Environment(\.dismiss) private var dismiss

    var body: some View {
        NavigationStack {
            ZStack {
                Color(.background)
                    .ignoresSafeArea()

                VStack {
                    Text("Configuration")
                        .font(.title.smallCaps())
                        .fontWeight(.bold)
                        .foregroundStyle(Color(.spotifyGreen))
                    
                    Spacer()
                }

            }
            .toolbar {
                Button {
                    dismiss()
                } label: {
                    Image(systemName: "xmark.circle.fill")
                        .closeButton()
                }
            }
        }
    }
}

#Preview {
    ConfigurationView()
}
