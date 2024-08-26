//
//  HelpView.swift
//  Spotify Match
//
//  Created by coni garcia on 25/08/2024.
//

import SwiftUI

struct HelpView: View {
    @Environment(\.dismiss) private var dismiss

    var body: some View {
        NavigationStack {
            ZStack {
                Color(.background)
                    .ignoresSafeArea()
                
                VStack(spacing: 20) {
                    Text("Get Started")
                        .font(.largeTitle.smallCaps())
                        .fontWeight(.black)
                        .foregroundStyle(Color(.spotifyGreen))
                    
                    Text("Select origin and destination playlists.")
                        .modifier(HelpText())
                    
                    HStack(spacing: 15) {
                        DemoPlaylistView(image: "global top 50", title: "Global Top 50")
                        
                        Image(systemName: "arrow.right")
                            .fontWeight(.bold)
                            .foregroundStyle(.spotifyGreen)
                        
                        DemoPlaylistView(image: "liked songs", title: "Liked Songs")
                    }
                    
                    Text("For each track of the origin playlist, decide whether or not you want to add it to the destination one.")
                        .modifier(HelpText())
                    
                    HStack(spacing: 20) {
                        Image(systemName: "checkmark.circle.fill")
                            .modifier(HelpIcon())
                            .foregroundStyle(.spotifyGreen)
                        
                        VStack(alignment: .leading) {
                            Text("Add")
                                .modifier(HelpTitle())
                                .foregroundStyle(.spotifyGreen)
                            
                            Divider()
                            
                            Text("Swipe right to add the track to the destination playlist.")
                                .modifier(HelpDescription())
                                .multilineTextAlignment(.leading)
                        }
                    }
                    .padding(.horizontal, 20)

                    HStack(spacing: 20) {
                        VStack(alignment: .trailing) {
                            Text("Dismiss")
                                .modifier(HelpTitle())
                                .foregroundStyle(.red)
                            
                            Divider()
                            
                            Text("Swipe left to dismiss the track without adding it to the destination playlist. Don't worry, it will remain in the origin playlist.")
                                .modifier(HelpDescription())
                                .multilineTextAlignment(.trailing)
                        }
                        Image(systemName: "xmark.circle.fill")
                            .modifier(HelpIcon())
                            .foregroundStyle(.red)
                    }
                    .padding(.horizontal, 20)

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

struct HelpText: ViewModifier {
    func body(content: Content) -> some View {
        content
            .fontWeight(.semibold)
            .foregroundStyle(.white)
            .multilineTextAlignment(.center)
            .padding(.horizontal, 20)
    }
}

struct DemoPlaylistView: View {
    let image: String
    let title: String
    var size: CGFloat = 110

    var body: some View {
        GroupBox {
            Image(image)
                .resizable()
                .frame(width: size, height: size)
            HStack {
                Text(title)
                    .font(.footnote)
                    .fontWeight(.bold)
                    .foregroundStyle(.white)
                    .lineLimit(1)
                    .multilineTextAlignment(.leading)
                
                Spacer()
            }
            .frame(width: size)
            .padding(.vertical, 1)
        }
        .backgroundStyle(Color(.separator))
    }
}

struct HelpIcon: ViewModifier {
    func body(content: Content) -> some View {
        content
            .font(.system(size: 50))
            .fontWeight(.bold)
    }
}

struct HelpTitle: ViewModifier {
    func body(content: Content) -> some View {
        content
            .font(.title.smallCaps())
            .fontWeight(.heavy)
    }
}

struct HelpDescription: ViewModifier {
    func body(content: Content) -> some View {
        content
            .fontWeight(.medium)
            .foregroundStyle(.gray)
    }
}

#Preview {
    HelpView()
}
