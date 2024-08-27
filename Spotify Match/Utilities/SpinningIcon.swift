//
//  SpinningIcon.swift
//  Spotify Match
//
//  Created by coni garcia on 27/08/2024.
//

import SwiftUI

enum ScaleAnimationPhase: CaseIterable {
    case small, big
    
    var weight: Font.Weight {
        switch self {
        case .small: .bold
        case .big: .black
        }
    }
    
    var scale: Double {
        switch self {
        case .small: 1
        case .big: 1.05
        }
    }
    
    var animation: Animation {
        switch self {
        case .small, .big: .easeInOut(duration: 0.8)
        }
    }
}

enum RotationAnimationPhase: CaseIterable {
    case start, end
    
    var angle: Double {
        switch self {
        case .start: 0
        case .end: 720
        }
    }
    
    var animation: Animation {
        switch self {
        case .start: .linear(duration: 0)
        case .end: .easeInOut(duration: 0.6)
        }
    }
}

struct SpinningIcon: View {
    @State var rotate = false
    @State var timer = Timer.publish(every: 10, on: .main, in: .common).autoconnect()
    
    let icon: String

    var body: some View {
        Image(systemName: icon)
            .font(.title3)
            .foregroundStyle(.spotifyGreen)
            .phaseAnimator(ScaleAnimationPhase.allCases) { content, phase in
                content
                    .fontWeight(phase.weight)
                    .scaleEffect(phase.scale)
            } animation: { phase in
                phase.animation
            }
            .phaseAnimator(RotationAnimationPhase.allCases, trigger: rotate) { content, phase in
                content
                    .rotationEffect(Angle(degrees: phase.angle))
            } animation: { phase in
                phase.animation
            }
            .frame(width: 30)
            .onReceive(timer) { _ in
                rotate.toggle()
            }
    }
}

#Preview {
    SpinningIcon(icon: "arrow.right")
}
