//
//  CustomARView.swift
//  WallDecorator
//
//  Created by Leo Magtibay on 7/10/25.
//

import Foundation
import RealityKit
import ARKit
import Combine
import UIKit

class CustomARView: ARView, ARSessionDelegate {
    private var cancellables = Set<AnyCancellable>()

    required init(frame frameRect: CGRect) { // changed here overried to required
        super.init(frame: frameRect)
        
        // Set delegate
        self.session.delegate = self
        
        // Configure AR session
        let config = ARWorldTrackingConfiguration()
        config.planeDetection = [.vertical]
        self.session.run(config, options: [.resetTracking, .removeExistingAnchors])

        print("✅ CustomARView initialized and session started with vertical detection")
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    // MARK: - ARSessionDelegate
    func session(_ session: ARSession, didAdd anchors: [ARAnchor]) {
        for anchor in anchors {
            guard let planeAnchor = anchor as? ARPlaneAnchor else { return }
            guard planeAnchor.alignment == .vertical else { return }

            print("✅ Vertical ARPlaneAnchor detected!")

            // Create grid mesh
            let mesh = MeshResource.generatePlane(width: 1.5, height: 1.5)
            let color = UIColor.blue.withAlphaComponent(0.8)
            let material = SimpleMaterial(color: color, isMetallic: false)
            let modelEntity = ModelEntity(mesh: mesh, materials: [material])

            // Create AnchorEntity for ARPlaneAnchor
            let anchorEntity = AnchorEntity(anchor: planeAnchor)
            anchorEntity.addChild(modelEntity)

            // Add to scene
            self.scene.addAnchor(anchorEntity)

            print("✅ Added transparent grid to vertical plane!")
        }
    }
}
