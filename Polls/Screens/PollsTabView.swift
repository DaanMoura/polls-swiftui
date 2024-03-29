//
//  PollsTabView.swift
//  Polls
//
//  Created by Daniel Moura on 19/02/24.
//

import SwiftUI

struct PollsTabView: View {
    @StateObject var appState = AppStateModel()
    
    var body: some View {
        TabView {
            HomeScreen()
                .tabItem { Label("Polls", systemImage: "house") }
            
            CreateScreen()
                .tabItem { Label("Create", systemImage: "plus") }
           
            JoinScreen()
                .tabItem { Label("Join", systemImage: "hand.point.up.left.and.text") }
        }
        .environmentObject(appState)
    }
}

#Preview {
    PollsTabView()
}
