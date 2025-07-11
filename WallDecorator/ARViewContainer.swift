//
//  ARViewContainer.swift
//  WallDecorator
//
//  Created by Leo Magtibay on 7/6/25.
//

import SwiftUI
import RealityKit
import ARKit
import Combine

struct ARViewContainer: UIViewRepresentable {
    
    private static var cancellables = Set<AnyCancellable>()
    
    
    func updateUIView(_ uiView: ARView, context: Context) {
        
    }
    
    func makeUIView(context: Context) -> ARView {
        return CustomARView(frame: .zero)
    }
}
