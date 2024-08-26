//
//  CardDeckViewModel.swift
//  Spotify Match
//
//  Created by coni garcia on 20/08/2024.
//

import Foundation

@Observable
final class CardDeckViewModel {
    var deck = [TrackCardView]()
    var topCardOffset = CGSize.zero

    private var tracks = [Track]()
    private var nextTrack = 1
    private var topCard: TrackCardView?
    
    func setup(spotifyController: SpotifyController, spotifyData: SpotifyData) async {
        await getTracks(spotifyController: spotifyController, spotifyData: spotifyData)
        createDeck()
        getTopCard()
    }
    
    func getTracks(spotifyController: SpotifyController, spotifyData: SpotifyData) async {
        do {
            let playlistTracks = try await getPlaylistTracks(
                spotifyController: spotifyController,
                playlistId: spotifyData.originPlaylist?.id ?? ""
            )
            
            tracks = playlistTracks.items.map { $0.track }
        } catch NetworkError.invalidURL {
            print("invalid URL")
        } catch NetworkError.invalidResponse {
            print("invalid response")
        } catch NetworkError.invalidData {
            print("invalid data")
        } catch {
            print("unexpected error")
        }
    }
    
    func createDeck() {
        if tracks.count > 0 {
            deck.append(TrackCardView(track: tracks[0]))
            if tracks.count > 1 {
                deck.append(TrackCardView(track: tracks[1]))
            }
        }
    }
    
    func getTopCard() {
        topCard = deck.first
    }
    
    func isTopCard(card: TrackCardView) -> Bool {
        return card.id == topCard!.id
    }
    
    func nextCard() {
        nextTrack = (nextTrack + 1) % tracks.count
        deck.removeFirst()
        deck.append(TrackCardView(track: tracks[nextTrack]))
        DispatchQueue.main.asyncAfter(deadline: DispatchTime.now() + 0.85, execute: {
            self.topCardOffset = .zero
            self.topCard = self.deck.first!
        })
    }
}

//let songSamples = [
//    Song(name: "BITTERSUITE", artist: "Billie Eilish", cover: "bittersuite"),
//    Song(name: "Perfect Places", artist: "Lorde", cover: "melodrama"),
//    Song(name: "Apple", artist: "Charlie XCX", cover: "brat")
//]
