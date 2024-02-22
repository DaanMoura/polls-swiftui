//
//  CreateScreen.swift
//  Polls
//
//  Created by Daniel Moura on 19/02/24.
//

import SwiftUI

struct CreateScreen: View {
    @EnvironmentObject var appState: AppStateModel
    @StateObject var viewModel = CreateScreenViewModel()
    
    var body: some View {
        NavigationStack {
            Form {
                Section(header: Text("Title")) {
                    TextField("Poll title", text: $viewModel.title)
                }
                
                Section(header: Text("Options")) {
                    ForEach(Array(viewModel.options.enumerated()), id: \.offset) { index, option in
                        TextField("Option \(index + 1)", text: $viewModel.options[index])
                            .deleteDisabled(viewModel.isDeleteDisabled)
                    }
                    .onDelete(perform: viewModel.deleteOption)
                    Button("New option", systemImage: "plus") {
                        viewModel.addNewOption()
                    }
                }
                
                Button("Create") {
                    Task {
                        await viewModel.createPoll() { poll in
                            appState.pushCreatedPoll(poll)
                        }
                    }
                }
                .tint(.accent)
                .disabled(!viewModel.isValid)
            }
                .navigationTitle("Create")
        }
        .sheet(isPresented: $viewModel.showSheet) {
            if viewModel.isLoading {
                ProgressView()
            } else {
                VStack(alignment: .center) {
                    Text("Poll code:")
                    Text(viewModel.pollCode)
                        .font(.largeTitle)
                        .padding()
                    
                    Button("Copy to clipboard", systemImage: "doc.on.doc") {
                        UIPasteboard.general.string = viewModel.pollCode
                    }
                    
                    Button("Close") {
                        viewModel.dismissSheet()
                    }
                }
                .padding()
            }
        }
    }
}

#Preview {
    CreateScreen()
}
