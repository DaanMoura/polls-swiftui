//
//  JoinScreenViewModel.swift
//  Polls
//
//  Created by Daniel Moura on 21/02/24.
//

import SwiftUI

final class JoinScreenViewModel: ObservableObject {
    
    @Published var pollCode = ""
    
    var isValid: Bool {
        if pollCode.isEmpty { return false }
        let regex = /^[a-zA-Z0-9]{6}$/
        return pollCode.firstMatch(of: regex) != nil
    }
    
    @MainActor func joinPoll(completion: (PollSaved) -> ()) async {
        do {
            let poll = try await NetworkManager.shared.getPoll(pollId: pollCode)
            let pollToSave = PollSaved(id: poll.id, title: poll.title)
            completion(pollToSave)
        } catch {
            // TODO: Show error alert
            print(error)
        }
    }
}
