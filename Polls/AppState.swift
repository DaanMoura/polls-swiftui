//
//  AppState.swift
//  Polls
//
//  Created by Daniel Moura on 21/02/24.
//

import SwiftUI

final class AppStateModel: ObservableObject {
    @AppStorage("appState") private var appStateData: Data?
    
    @Published var createdPolls: [PollSaved] = []
    @Published var joinedPolls: [PollSaved] = []
    
    init() {
        retrieveAppState()
    }
    
    func retrieveAppState() {
        guard let data = appStateData else { return }
        
        do {
            let appState = try JSONDecoder().decode(AppState.self, from: data)
            createdPolls = appState.createdPolls
            joinedPolls = appState.joinedPolls
        } catch {
            // TODO: Show error
            print(error)
        }
    }
    
    func saveState() {
        do {
            let appState = AppState(createdPolls: createdPolls, joinedPolls: joinedPolls)
            appStateData = try JSONEncoder().encode(appState)
        } catch {
            // TODO: Show error
            print(error)
        }
    }
    
    func pushCreatedPoll(_ poll: PollSaved) {
        createdPolls.append(poll)
        saveState()
    }
    
    func pushJoinedPoll(_ poll: PollSaved) {
        joinedPolls.append(poll)
        saveState()
    }
    
    func removeCreatedPollAt (at offsets: IndexSet) {
        createdPolls.remove(atOffsets: offsets)
        saveState()
    }
    
    func removeJoinedPollAt (at offsets: IndexSet) {
        joinedPolls.remove(atOffsets: offsets)
        saveState()
    }
}

struct AppState: Codable {
    var createdPolls: [PollSaved] = []
    var joinedPolls: [PollSaved] = []
}
