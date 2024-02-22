//
//  CreateScreenViewModel.swift
//  Polls
//
//  Created by Daniel Moura on 19/02/24.
//

import SwiftUI

final class CreateScreenViewModel: ObservableObject {
    
    @Published var title = ""
    @Published var options: [String] = ["", ""]
    
    @Published var showSheet = false
    @Published var isLoading = false
    @Published var pollCode = ""
    
    var isValid: Bool {
        guard !title.isEmpty else { return false }
        guard options.allSatisfy({ option in !option.isEmpty}) else { return false }
        return options.count > 1
    }
    
    var isDeleteDisabled: Bool {
        options.count == 2
    }
    
    func addNewOption() {
        options.append("")
    }
    
    func deleteOption(at offsets: IndexSet) {
        options.remove(atOffsets: offsets)
    }
    
    @MainActor func createPoll(completion: (PollSaved) -> ()) async {
        showSheet = true
        isLoading = true
        
        do {
            pollCode = try await NetworkManager.shared.createPoll(title: title, options: options)
            isLoading = false
            let pollToSave = PollSaved(id: pollCode, title: title)
            completion(pollToSave)
        } catch {
            isLoading = false
            // TODO: Show error alert
            print(error)
        }
    }
    
    func dismissSheet() {
        showSheet = false
    }
}
