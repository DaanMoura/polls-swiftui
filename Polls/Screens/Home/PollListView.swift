//
//  PollListView.swift
//  Polls
//
//  Created by Daniel Moura on 22/02/24.
//

import SwiftUI

struct PollListView: View {
    
    let title: String
    let polls: [PollSaved]
    
    let completion: (PollSaved) -> ()
    let onDelete: (IndexSet) -> ()
    
    var body: some View {
        Form {
            Section(header: Text(title)) {
                ForEach(polls) { poll in
                    Button(poll.title) {
                        completion(poll)
                    }
                }
                .onDelete(perform: onDelete)
            }
        }
    }
}

//#Preview {
//    PollListView()
//}
