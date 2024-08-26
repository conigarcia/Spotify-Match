//
//  SpotifyController.swift
//  SpotifyQuickStart
//
//  Created by Till Hainbach on 02.04.21.
//

import SwiftUI
import SpotifyiOS
import Combine

@Observable class SpotifyController: NSObject {
    let spotifyClientID = "daf03714c388450c844fd00fef509b9d"
    let spotifyRedirectURL = URL(string:"spotifymatch://")!
    
    var accessToken: String? = nil
    
//    private var connectCancellable: AnyCancellable?
//    
//    private var disconnectCancellable: AnyCancellable?
    
//    override init() {
//        super.init()
//        connectCancellable = NotificationCenter.default.publisher(for: UIApplication.didBecomeActiveNotification)
//            .receive(on: DispatchQueue.main)
//            .sink { _ in
//                self.connect()
//            }
//        
//        disconnectCancellable = NotificationCenter.default.publisher(for: UIApplication.willResignActiveNotification)
//            .receive(on: DispatchQueue.main)
//            .sink { _ in
//                self.disconnect()
//            }
//
//    }
        
    @ObservationIgnored lazy var configuration = SPTConfiguration(clientID: self.spotifyClientID, redirectURL: self.spotifyRedirectURL)

    @ObservationIgnored lazy var appRemote: SPTAppRemote = {
        let appRemote = SPTAppRemote(configuration: self.configuration, logLevel: .debug)
        appRemote.connectionParameters.accessToken = self.accessToken
        appRemote.delegate = self
        return appRemote
    }()
    
    func setAccessToken(from url: URL) {
        let parameters = appRemote.authorizationParameters(from: url)
        
        if let accessToken = parameters?[SPTAppRemoteAccessTokenKey] {
            appRemote.connectionParameters.accessToken = accessToken
            self.accessToken = accessToken
        } else if let errorDescription = parameters?[SPTAppRemoteErrorDescriptionKey] {
            print(errorDescription)
        }        
    }
    
    var connected = false

    func connect() {
        guard let _ = self.appRemote.connectionParameters.accessToken else {
            self.appRemote.authorizeAndPlayURI("")
            appRemote.connect()
            return
        }

        appRemote.connect()
    }
    
    func disconnect() {
        if appRemote.isConnected {
            appRemote.disconnect()
        }
    }
}

extension SpotifyController: SPTAppRemoteDelegate {
    func appRemoteDidEstablishConnection(_ appRemote: SPTAppRemote) {
        self.appRemote = appRemote
        connected = true
    }
    
    func appRemote(_ appRemote: SPTAppRemote, didFailConnectionAttemptWithError error: Error?) {
        connected = false
        print(error?.localizedDescription ?? "failed connection attempt")
    }
    
    func appRemote(_ appRemote: SPTAppRemote, didDisconnectWithError error: Error?) {
        connected = false
        print(error?.localizedDescription ?? "disconnected")
    }
}
