//
//  PollsApp.swift
//  Polls
//
//  Created by Daniel Moura on 17/02/24.
//

import SwiftUI

@main
struct PollsApp: App {
    var body: some Scene {
        WindowGroup {
            PollsTabView()
        }
        .defaultSize(width: 0.5, height: 0.5, depth: 0.0, in: .meters)
    }
}
