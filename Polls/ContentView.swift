//
//  ContentView.swift
//  Polls
//
//  Created by Daniel Moura on 17/02/24.
//

import SwiftUI
import RealityKit
import RealityKitContent

struct ContentView: View {

    var body: some View {
        VStack(alignment: .leading, spacing: 20) {
           
            BarRow(value: 5, maxValue: 5)
            BarRow(value: 3, maxValue: 5)
            BarRow(value: 1, maxValue: 5)
            
        }
        .padding()
    }
}

#Preview(windowStyle: .plain) {
    ContentView()
}
