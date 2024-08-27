//
//  TextModifiers.swift
//  Spotify Match
//
//  Created by coni garcia on 26/08/2024.
//

import SwiftUI

struct RegularText: ViewModifier {
    func body(content: Content) -> some View {
        content
            .fontWeight(.semibold)
            .multilineTextAlignment(.center)
    }
}

struct TitleText: ViewModifier {
    func body(content: Content) -> some View {
        content
            .font(.title)
            .fontWeight(.black)
    }
}

extension View {
    func regularText() -> some View {
        modifier(RegularText())
    }
    
    func titleText() -> some View {
        modifier(TitleText())
    }
}
