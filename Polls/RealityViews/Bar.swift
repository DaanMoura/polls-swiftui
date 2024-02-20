//
//  Bar.swift
//  Polls
//
//  Created by Daniel Moura on 17/02/24.
//

import SwiftUI
import RealityKit

struct Bar: View {
    let value: Float
    let color: UIColor
    
    var body: some View {
        RealityView { content in
            let model = ModelEntity(
                mesh: .generateBox(width: 0.005 * value,
                                   height: 0.05,
                                   depth: 0.05,
                                   cornerRadius: 24),
                materials: [SimpleMaterial(color: color,
                                           isMetallic: false)]
                
            )
            content.add(model)
        }
        .frame(depth: 100)
        .frame(width: CGFloat(value * 6.8), height: 80)
        .scaledToFit()
    }
}

#Preview {
    Bar(value: 30, color: .blue)
}
