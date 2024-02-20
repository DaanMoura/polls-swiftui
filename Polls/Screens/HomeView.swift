//
//  HomeView.swift
//  Polls
//
//  Created by Daniel Moura on 18/02/24.
//

import SwiftUI

struct HomeView: View {
    @State private var pollCode: String = ""
    
    var body: some View {
        NavigationStack {
            VStack {
                Spacer()
                Button {
                    print("create poll")
                } label: {
                    Image(systemName: "plus")
                    Text("Create poll")
                }
                Spacer()
                Divider()
                Spacer()
                TextField("Poll code", text: $pollCode)
                    .frame(maxWidth: 200)
                    .textFieldStyle(.roundedBorder)
                Button {
                    print("join poll")
                } label: {
                    Image(systemName: "hand.point.up.left.and.text")
                    Text("Join poll")
                }
                Spacer()
            }
            .navigationTitle("✅ Polls")
        }
    }
}

#Preview {
    HomeView()
}
