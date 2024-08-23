//
//  APICalls.swift
//  Spotify Match
//
//  Created by coni garcia on 23/08/2024.
//

import Foundation

func playlistsURLRequest(spotifyController: SpotifyController) -> URLRequest? {
    var components = URLComponents()
    components.scheme = "https"
    components.host = "api.spotify.com"
    components.path = "/v1/me/playlists"
    
    guard let url = components.url else { return nil }
    
    
    var urlRequest = URLRequest(url: url)
    urlRequest.addValue("Bearer " + (spotifyController.accessToken ?? ""), forHTTPHeaderField: "Authorization")
    urlRequest.httpMethod = "GET"
    
    return urlRequest
}

func getPlaylists(spotifyController: SpotifyController) async throws -> PlaylistSet {
    guard let urlRequest = playlistsURLRequest(spotifyController: spotifyController) else {
        throw NetworkError.invalidURL
    }
    
    let (data, response) = try await URLSession.shared.data(for: urlRequest)
    
    guard let response = response as? HTTPURLResponse, response.statusCode == 200 else {
        throw NetworkError.invalidResponse
    }
    
    do {
        let decoder = JSONDecoder()
        return try decoder.decode(PlaylistSet.self, from: data)
    } catch {
        throw NetworkError.invalidData
    }
}
