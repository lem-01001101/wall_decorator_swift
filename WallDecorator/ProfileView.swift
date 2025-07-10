//
//  ProfileView.swift
//  WallDecorator
//
//  Created by Leo Magtibay on 7/6/25.
//

import SwiftUI

struct ProfileView: View {
    @EnvironmentObject var settings: AppSettings
    var body: some View {
        Text("What's up, \(settings.username)")
        //Text("aaa")
    }
}

#Preview {
    ProfileView()
        .environmentObject(AppSettings())
}
