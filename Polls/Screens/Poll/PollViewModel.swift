//
//  PollViewModel.swift
//  Polls
//
//  Created by Daniel Moura on 27/02/24.
//

import SwiftUI

final class PollViewModel: ObservableObject {
    
    @Published var voteOption: String = ""

    @Published var poll: Poll? = nil
    @Published var isLoading = false
    
    @MainActor func getPoll(pollId: String) async {
        isLoading = true
        do {
            poll = try await NetworkManager.shared.getPoll(pollId: pollId)
            isLoading = false
        } catch {
            isLoading = false
            // TODO: show error alert
            print(error)
        }
    }
    
    var isVoteDisabled: Bool {
        voteOption.isEmpty
    }
    
    func vote(completion: (String) -> ()) async {
        guard !isVoteDisabled else {
            return
        }
        do {
            try await NetworkManager.shared.voteOnPoll(pollId: poll!.id,
                                                       pollOptionId: voteOption)
            completion(voteOption)
        } catch {
            // TODO: show error alert
            print(error)
        }
    }
}
