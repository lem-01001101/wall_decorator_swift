//
//  FrameStyle.swift
//  WallDecorator
//
//  Created by Leo Magtibay on 7/29/25.
//

import Foundation
import SwiftUI

enum FrameStyle: String, CaseIterable {
    case classic
    case modern
    case pop
}

class FrameSettings: ObservableObject {
    @Published var currentStyle: FrameStyle = .classic
}
