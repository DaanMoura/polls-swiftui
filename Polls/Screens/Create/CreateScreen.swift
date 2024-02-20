//
//  CreateScreen.swift
//  Polls
//
//  Created by Daniel Moura on 19/02/24.
//

import SwiftUI

struct CreateScreen: View {
    
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
                    viewModel.createPoll()
                }
                .tint(.accent)
                .disabled(!viewModel.isValid)
            }
                .navigationTitle("Create")
        }
        .sheet(isPresented: $viewModel.showSheet) {
            Text("Poll created")
            Button("Ok") { viewModel.dismissSheet() }
        }
    }
}

#Preview {
    CreateScreen()
}
