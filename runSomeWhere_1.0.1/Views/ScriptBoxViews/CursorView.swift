//
//  CursorView.swift
//  runSomeWhere_1.0.1
//
//  Created by Yun Dongbeom on 2023/04/04.
//

import SwiftUI

struct CursorView: View {
    @State private var isFlickering = false
    
    var body: some View {
        Image("Image_Button")
            .opacity(isFlickering ? 0.01 : 1.0)
            .animation(Animation.easeOut(duration: 0.3) .repeatForever(autoreverses: true) , value: isFlickering
            )
            .onAppear() {
            isFlickering = true
        }
    }
}
