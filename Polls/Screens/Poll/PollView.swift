//
//  PollView.swift
//  Polls
//
//  Created by Daniel Moura on 22/02/24.
//

import SwiftUI

struct PollView: View {
    
    @StateObject var viewModel = PollViewModel()
    
    @Binding var selectedPoll: PollSaved
    
    var body: some View {
        NavigationStack {
            VStack {
                if (viewModel.isLoading) {
                    ProgressView()
                } else if (viewModel.poll == nil) {
                    Text("Poll not found!")
                } else if (selectedPoll.voteOption != nil) {
                    Text("Thank you for voting!")
                    Text(selectedPoll.voteOption ?? "")
                } else {
                    Form {
                        Section(header: Text(selectedPoll.title)) {
                            Picker(selection: $viewModel.voteOption, label: EmptyView()) {
                                ForEach(viewModel.poll!.options) { option in
                                    Text(option.title)
                                }
                            }
                            .pickerStyle(.inline)
                        }
                        Button("Vote") {
                            Task {
                                await viewModel.vote() { pollOptionId in
                                    selectedPoll.voteOption = pollOptionId
                                }
                            }
                        }
                        .disabled(viewModel.isVoteDisabled)
                    }
                }
            }
            .navigationTitle(selectedPoll.title)
        }
        .task {
            await viewModel.getPoll(pollId: selectedPoll.id)
        }
    }
}

#Preview {
    PollView(selectedPoll: Binding.constant(PollSaved(id: "1", title: "Test", voteOption: nil)))
}
