//
//  AppSettings.swift
//  WallDecorator
//
//  Created by Leo Magtibay on 7/6/25.
//

import Foundation

class AppSettings: ObservableObject {
    @Published var username: String = "Guest"
    
    func newUserName(name: String) {
        username = name
    }
    
}
