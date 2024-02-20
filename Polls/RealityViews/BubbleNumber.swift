//
//  BubbleNumber.swift
//  Polls
//
//  Created by Daniel Moura on 18/02/24.
//

import SwiftUI
import RealityKit

struct BubbleNumber: View {
    let value: Float
    let color: UIColor
    
    var body: some View {
        RealityView { content in
            let bubbleModel = ModelEntity(
                mesh: .generateSphere(radius: 0.05),
                materials: [SimpleMaterial(color: .white.withAlphaComponent(0.25),
                                           isMetallic: false)]
            )
            
            let numberModel = ModelEntity(
                mesh: .generateText(
                    "\(Int(value))",
                    extrusionDepth: 0.005,
                    font: .init(descriptor: .init(name: "Arial Rounded MT Bold",
                                                  size: 0.05),
                                size: 0.05),
                    containerFrame: .zero,
                    alignment: .center
                ),
                materials: [SimpleMaterial(color: color, isMetallic: false)]
            )
            
            numberModel.position = [-0.03, -0.03, 0]

            if (value >= 100) {
                numberModel.position.x = -0.042
            } else if (value < 10) {
                numberModel.position.x = -0.018
            }
  
            bubbleModel.scale = [0.5, 0.5, 0.5]
    
            content.add(bubbleModel)
            bubbleModel.addChild(numberModel)
        }
        .frame(depth: 100)
        .frame(width: 40, height: 40)
        .scaledToFit()
    }
}

#Preview {
    BubbleNumber(value: 100, color: .blue)
}
