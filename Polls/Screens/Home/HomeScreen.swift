//
//  ListScreen.swift
//  Polls
//
//  Created by Daniel Moura on 19/02/24.
//

import SwiftUI

struct HomeScreen: View {
    @EnvironmentObject var appState: AppStateModel
    
    var body: some View {
        NavigationStack {
            VStack {
                if (appState.createdPolls.isEmpty && appState.joinedPolls.isEmpty) {
                    VStack {
                        Text("You don't have created or joined any polls yet!")
                            .padding()
                        NavigationLink(destination: CreateScreen()) {
                            Text("Create a poll")
                        }
                        Text("or")
                        NavigationLink(destination: JoinScreen()) {
                            Text("Join a poll")
                        }
                    }
                } else {
                    if !appState.createdPolls.isEmpty {
                        PollListView(title: "Created polls", polls: appState.createdPolls) { poll in
                            appState.selectedPoll = poll
                        } onDelete: { indexSet in
                            appState.removeCreatedPollAt(at: indexSet)
                        }
                    }
                    if !appState.joinedPolls.isEmpty {
                        PollListView(title: "Joined polls", polls: appState.joinedPolls) { poll in
                            appState.selectedPoll = poll
                        } onDelete: { indexSet in
                            appState.removeJoinedPollAt(at: indexSet)
                        }
                    }
                }
            }
            .navigationDestination(item: $appState.selectedPoll, destination: { poll in
                PollView(selectedPoll: poll)
            })
            .navigationTitle("Polls")
        }
    }
}

#Preview {
    HomeScreen()
}
