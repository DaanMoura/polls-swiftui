//
//  BarRow.swift
//  Polls
//
//  Created by Daniel Moura on 18/02/24.
//

import SwiftUI

struct BarRow: View {
    let value: Float
    let maxValue: Float
    
    var percentage: Float {
        (value / maxValue) * 100
    }
    
    var body: some View {
        HStack(spacing: 24) {
            Bar(value: percentage,
                color: UIColor(Color(.accent)))
            BubbleNumber(value: value, 
                         color: .black)
        }
    }
}

#Preview {
    BarRow(value: 30, maxValue: 100)
}
