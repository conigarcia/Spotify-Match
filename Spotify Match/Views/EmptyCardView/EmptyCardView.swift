//
//  EmptyCardView.swift
//  Spotify Match
//
//  Created by coni garcia on 25/08/2024.
//

import SwiftUI

struct EmptyCardView: View {
    let size: CGFloat = 300
    var text = ""
    
    var body: some View {
        GroupBox {
            VStack(alignment: .leading) {
                Rectangle()
                    .foregroundStyle(Color(.systemGray5))
                    .frame(width: size, height: size)
                    .overlay {
                        Text(text)
                            .regularText()
                    }
                
                HStack {
                    Text("_________")
                        .font(.largeTitle)
                        .fontWeight(.black)
                        .scaledToFit()
                        .minimumScaleFactor(0.6)
                        .foregroundStyle(.gray)
                        .lineLimit(1)
                    Spacer()
                }
                .frame(width: size)
                
                HStack {
                    Text("______")
                        .font(.headline)
                        .fontWeight(.black)
                        .foregroundStyle(.gray)
                        .lineLimit(1)
                    Spacer()
                }
                .frame(width: size)
            }
            .padding()
        }
    }
}

#Preview {
    EmptyCardView(text: "No origin playlist selected.")
}
