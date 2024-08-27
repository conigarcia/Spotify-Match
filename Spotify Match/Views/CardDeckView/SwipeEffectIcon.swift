//
//  SwipeEffectIcon.swift
//  Spotify Match
//
//  Created by coni garcia on 21/08/2024.
//

import SwiftUI

struct SwipeEffectIcon: View {
    let regularIcon: String
    let specialIcon: String
    var isSpecial: Bool
    let text: String
    let color: Color
    let offset: Double

    var body: some View {
        VStack {
            Image(systemName: isSpecial ? specialIcon : regularIcon)
                .font(.system(size: 100))
                .symbolEffect(.bounce, value: isSpecial)
                .contentTransition(.symbolEffect(.replace))
            Text(text)
                .fontWeight(.bold)
        }
        .foregroundStyle(color)
        .offset(x: offset)
        .transition(
            .asymmetric(
                insertion: .move(edge: offset > 0 ? .trailing : .leading),
                removal: .identity
            )
        )
    }
}

#Preview("check") {
    SwipeEffectIcon(
        regularIcon: "checkmark.circle",
        specialIcon: "checkmark.circle.fill",
        isSpecial: false,
        text: "Add song",
        color: .green,
        offset: -70
    )
}

#Preview("cross") {
    SwipeEffectIcon(
        regularIcon: "xmark.circle",
        specialIcon: "xmark.circle.fill",
        isSpecial: true,
        text: "Dismiss song",
        color: .red,
        offset: 70
    )
}
