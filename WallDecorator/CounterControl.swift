//
//  CounterCount.swift
//  WallDecorator
//
//  Created by Leo Magtibay on 7/3/25.
//

import SwiftUI

struct CounterControl: View {
    @ObservedObject var viewModel: CounterViewModel
    var body: some View {
        Button ("Increment") {
            viewModel.increment()
            print("current count = \(viewModel.count)")
        }
        Button("reset"){
            //count = 0
            viewModel.reset()
            print("reset! count = \(viewModel.count)")
            
        }
    }
}

#Preview {
    CounterControl(viewModel: CounterViewModel())
}
