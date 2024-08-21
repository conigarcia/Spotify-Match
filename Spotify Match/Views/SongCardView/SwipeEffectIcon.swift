//
//  SwipeEffectIcon.swift
//  Spotify Match
//
//  Created by coni garcia on 21/08/2024.
//

import SwiftUI

struct SwipeEffectIcon: View {
    let icon: String
    let text: String
    let color: Color
    let offset: Double

    var body: some View {
        VStack {
            Image(systemName: icon)
                .resizable()
                .frame(width: 100, height: 100)
            Text(text)
                .fontWeight(.bold)
        }
        .foregroundStyle(color)
        .offset(x: offset)
        .transition(
            .asymmetric(
                insertion: .move(edge: offset < 0 ? .leading : .trailing),
                removal: .identity
            )
        )
    }
}

#Preview("check") {
    SwipeEffectIcon(
        icon: "checkmark.circle",
        text: "Add song",
        color: .green,
        offset: -70
    )
}

#Preview("cross") {
    SwipeEffectIcon(
        icon: "xmark.circle",
        text: "Dismiss song",
        color: .red,
        offset: 70
    )
}
