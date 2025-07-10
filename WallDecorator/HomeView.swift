//
//  HomeView.swift
//  WallDecorator
//
//  Created by Leo Magtibay on 7/5/25.
//

import SwiftUI

struct HomeView: View {
    @ObservedObject var viewModel = CounterViewModel()
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
                    
                    
                    NavigationLink ("Counter", destination: CounterView(viewModel: CounterViewModel()))
                        .padding()
                    
                    TextField("User Name: ", text: $username)
                        .onSubmit {
                            settings.username = username
                        }
                    
                    NavigationLink("View Profile", destination: ProfileView())
                        .padding()
                    
                }
            }
        }

   }
}

#Preview {
    HomeView()
        .environmentObject(AppSettings())
}
