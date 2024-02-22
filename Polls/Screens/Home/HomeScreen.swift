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
            ScrollView {
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
                    .padding(.top, 72)
                } else {
                    if !appState.createdPolls.isEmpty {
                        Section(header: Text("Created polls")) {
                            ForEach(appState.createdPolls) { poll in
                                Text(poll.title)
                            }
                        }
                    }
                    if !appState.joinedPolls.isEmpty {
                        Section(header: Text("Joined polls")) {
                            ForEach(appState.joinedPolls) { poll in
                                Text(poll.title)
                            }
                        }
                    }
                }
            }
            .navigationTitle("Polls")
        }
    }
}

#Preview {
    HomeScreen()
}
