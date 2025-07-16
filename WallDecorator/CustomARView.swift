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
//import UIKit

class CustomARView: ARView, ARSessionDelegate {
    private var cancellables = Set<AnyCancellable>()

    required init(frame frameRect: CGRect) { // changed here overried to required
        super.init(frame: frameRect)
        
        // gesture recognizer
        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(handleTap))
        self.addGestureRecognizer(tapGesture)
        
        // Set delegate
        self.session.delegate = self
        
        // Configure AR session
        let config = ARWorldTrackingConfiguration()
        config.planeDetection = [.vertical]
        self.session.run(config, options: [.resetTracking, .removeExistingAnchors])

        print("✅ CustomARView initialized and session started with vertical detection")
    }
    
    @objc func handleTap(_ sender: UITapGestureRecognizer) {
        let location = sender.location(in: self)
        print("✅ Tap detected at screen location: \(location)")

        // Perform raycast
        guard let result = self.raycast(from: location) else {
            print("❌ No vertical plane hit detected")
            return
        }

        print("✅ Vertical plane hit at world transform: \(result.worldTransform)")
        placeFrame(at: result.worldTransform)
    }
    
    func raycast(from point: CGPoint) -> ARRaycastResult? {
        let results = self.raycast(
            from: point,
            allowing: .existingPlaneGeometry,
            alignment: .vertical
        )
        return results.first
    }
    
    func placeFrame(at transform: simd_float4x4) {
        // Create a small art frame mesh
        let mesh = MeshResource.generatePlane(width: 0.5, height: 0.5)
        let color = UIColor.red.withAlphaComponent(0.85)
        let material = SimpleMaterial(color: color, isMetallic: false)
        let modelEntity = ModelEntity(mesh: mesh, materials: [material])
        
        // rotate the model to flush with the wall
        modelEntity.transform.rotation = simd_quatf(angle: -.pi / 2, axis: [1, 0, 0])

        // Create anchor at exact world position
        let anchor = AnchorEntity(world: transform)
        anchor.addChild(modelEntity)

        self.scene.addAnchor(anchor)
        print("✅ Art frame added at wall position!")
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
            let color = UIColor.blue.withAlphaComponent(0.3)
            let material = SimpleMaterial(color: color, isMetallic: false)
            let modelEntity = ModelEntity(mesh: mesh, materials: [material])
            
            // rotate the model to flush with the wall
            modelEntity.transform.rotation = simd_quatf(angle: -.pi / 2, axis: [1, 0, 0])

            // Create AnchorEntity for ARPlaneAnchor
            let anchorEntity = AnchorEntity(anchor: planeAnchor)
            anchorEntity.addChild(modelEntity)

            // Add to scene
            self.scene.addAnchor(anchorEntity)

            print("✅ Added transparent grid to vertical plane!")
        }
    }
}
