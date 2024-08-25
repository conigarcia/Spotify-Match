//
//  SPGroupBoxStyle.swift
//  Spotify Match
//
//  Created by coni garcia on 24/08/2024.
//

import SwiftUI

struct SPGroupBoxStyle: GroupBoxStyle {
    func makeBody(configuration: Configuration) -> some View {
        VStack {
            configuration.label
            configuration.content
        }
        .padding(10)
        .background(Color(.separator))
        .clipShape(.rect(cornerRadius: 10))
    }
}

extension GroupBoxStyle where Self == SPGroupBoxStyle {
    static var SPGroupBoxStyle: SPGroupBoxStyle { .init() }
}

#Preview {
    GroupBox {
        Text("Some text")
    }
    .groupBoxStyle(.SPGroupBoxStyle)
}
