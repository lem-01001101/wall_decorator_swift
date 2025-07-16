//
//  HomeView.swift
//  WallDecorator
//
//  Created by Leo Magtibay on 7/5/25.
//

import SwiftUI

struct HomeView: View {
    @State private var username: String = ""
    @EnvironmentObject var settings: AppSettings
    
    
    var body: some View {
        NavigationStack {
            ZStack {
                ARViewContainer()
                    .edgesIgnoringSafeArea(.all)
                VStack {
                    Text("Wall Decorator App")
                        .font(.largeTitle)
                        .padding()
                        .foregroundColor(.white)
                }
            }
        }

   }
}

#Preview {
    HomeView()
        .environmentObject(AppSettings())
}
