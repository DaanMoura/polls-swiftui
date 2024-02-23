//
//  PollView.swift
//  Polls
//
//  Created by Daniel Moura on 22/02/24.
//

import SwiftUI

struct PollView: View {
    let selectedPoll: PollSaved
    var body: some View {
        NavigationStack {
            Text(selectedPoll.title)
                .navigationTitle(selectedPoll.title)
        }
    }
}

//#Preview {
//    PollView()
//}
