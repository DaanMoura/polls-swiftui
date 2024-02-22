//
//  SwiftUIView.swift
//  Polls
//
//  Created by Daniel Moura on 19/02/24.
//

import SwiftUI

struct JoinScreen: View {
    
    @EnvironmentObject var appState: AppStateModel
    @StateObject var viewModel = JoinScreenViewModel()
    
    var body: some View {
        NavigationStack {
            VStack(alignment: .center) {
                Text("Enter the poll code below:")
                TextField("Poll code", text: $viewModel.pollCode)
                    .frame(width: 200)
                    .textFieldStyle(.roundedBorder)
                    .padding()
                Button("Join") {
                    Task {
                        await viewModel.joinPoll() { poll in
                            appState.pushJoinedPoll(poll)
                        }
                    }
                }
                .disabled(!viewModel.isValid)
            }
            .navigationTitle("Join")
        }
    }
}

#Preview {
    JoinScreen()
}
