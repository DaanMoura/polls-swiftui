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
    
    func createPoll() {
        showSheet = true
        print("create")
    }
    
    func dismissSheet() {
        showSheet = false
    }
}
