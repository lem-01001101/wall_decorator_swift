//
//  WallDecoratorApp.swift
//  WallDecorator
//
//  Created by Leo Magtibay on 7/3/25.
//

import SwiftUI

@main
struct WallDecoratorApp: App {
    @StateObject private var settings = AppSettings()
    
    var body: some Scene {
        WindowGroup {
            HomeView()
                .environmentObject(settings)
        }
    }
}
