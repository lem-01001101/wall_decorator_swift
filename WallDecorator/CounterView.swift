//
//  ContentView.swift
//  WallDecorator
//
//  Created by Leo Magtibay on 7/3/25.
//

import SwiftUI

struct CounterView: View {
    //@State private var count = 0
    @ObservedObject var viewModel: CounterViewModel
    
    var body: some View {
        VStack {
            Text("Wall Decorator")
                .font(.title)
            
            Text("Count")
            CounterControl(viewModel: viewModel)
        }
        .padding()
    }
}

#Preview {
    CounterView(viewModel: CounterViewModel())
}
