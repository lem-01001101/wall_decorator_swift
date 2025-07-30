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
                        .foregroundColor(.black)
                        .background(Color(red: 253/255, green:250/255, blue:242/255))
                        .clipShape(RoundedRectangle(cornerRadius: 12, style: .continuous))
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
