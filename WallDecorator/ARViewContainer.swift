//
//  ARViewContainer.swift
//  WallDecorator
//
//  Created by Leo Magtibay on 7/6/25.
//

import SwiftUI
import RealityKit
import ARKit

struct ARViewContainer: UIViewRepresentable {
    func updateUIView(_ uiView: ARView, context: Context) {
        
    }
    
    func makeUIView(context: Context) -> ARView {
        let arView = ARView(frame: .zero)
        
        let config = ARWorldTrackingConfiguration()
        config.planeDetection = [.vertical]
        
        arView.session.run(config)
        
        return arView
    }
}
/*
#Preview {
    ARViewContainer()
}
*/
