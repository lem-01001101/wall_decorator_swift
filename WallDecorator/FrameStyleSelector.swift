//
//  FrameStyleSelector.swift
//  WallDecorator
//
//  Created by Leo Magtibay on 7/29/25.
//

import SwiftUI

struct FrameStyleSelector: View {
    //@EnvironmentObject var frameSettings: FrameSettings
    @EnvironmentObject var frameSettings: FrameSettings
    
    var body: some View {
        HStack {
            ForEach(FrameStyle.allCases, id: \.self) { style in
                Button(action: {
                    frameSettings.currentStyle = style
                }) {
                    Text(style.rawValue.capitalized)
                        .padding()
                        .foregroundColor(.black)
                        //.background(Color(red: 253/255, green:250/255, blue:242/255))
                        .background(
                            frameSettings.currentStyle == style ? Color(red: 253/255, green:250/255, blue:242/255) : Color.clear
                        )
                        .cornerRadius(8)
                }
            }
        }
    }
}

#Preview {
    FrameStyleSelector()
}
