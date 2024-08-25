//
//  ViewSize.swift
//  Spotify Match
//
//  Created by coni garcia on 25/08/2024.
//  https://stackoverflow.com/questions/57577462/get-width-of-a-view-using-in-swiftui
//

import Foundation
import SwiftUI

struct SizeCalculator: ViewModifier {
    
    @Binding var size: CGSize
    
    func body(content: Content) -> some View {
        content
            .background(
                GeometryReader { proxy in
                    Color.clear // we just want the reader to get triggered, so let's use an empty color
                        .onAppear {
                            size = proxy.size
                        }
                }
            )
    }
}

extension View {
    func saveSize(in size: Binding<CGSize>) -> some View {
        modifier(SizeCalculator(size: size))
    }
}
