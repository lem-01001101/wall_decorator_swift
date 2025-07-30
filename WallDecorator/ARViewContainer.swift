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
    @EnvironmentObject var frameSettings: FrameSettings
    
    private static var cancellables = Set<AnyCancellable>()
    
    
    func updateUIView(_ uiView: ARView, context: Context) {
        if let view = uiView as? CustomARView {
            view.currentStyle = frameSettings.currentStyle
        }
    }
    
    func makeUIView(context: Context) -> ARView {
        let view = CustomARView(frame: .zero)
        view.currentStyle = frameSettings.currentStyle
        
        return CustomARView(frame: .zero)
    }
}
