//
//  HomeView.swift
//  WallDecorator
//
//  Created by Leo Magtibay on 7/5/25.
//

import SwiftUI

struct HomeView: View {
    @State private var username: String = ""
    
    
    var body: some View {
        NavigationStack {
            ZStack {
                ARViewContainer()
                    .edgesIgnoringSafeArea(.all)
                VStack {
                    Text("Wall Decorator App")
                        .font(.largeTitle)
                        .padding()
                        .foregroundColor(.green)
                    Spacer()
                    FrameStyleSelector()
                        .padding()
                }
            }
        }

   }
}

#Preview {
    HomeView()
}
