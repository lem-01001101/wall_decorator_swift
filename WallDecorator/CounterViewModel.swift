//
//  CounterViewModel.swift
//  WallDecorator
//
//  Created by Leo Magtibay on 7/5/25.
//

import Foundation

class CounterViewModel: ObservableObject {
    @Published var count: Int = 0
    
    func increment() {
        count += 1
    }
    
    func reset() {
        count = 0
    }
}
