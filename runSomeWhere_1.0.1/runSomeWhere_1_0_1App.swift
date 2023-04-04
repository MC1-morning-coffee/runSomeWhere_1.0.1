//
//  runSomeWhere_1_0_1App.swift
//  runSomeWhere_1.0.1
//
//  Created by Yun Dongbeom on 2023/04/04.
//

import SwiftUI

@main
struct runSomeWhere_1_0_1App: App {

    init() {
        CustomFont.registerFonts(fontName: "morris9")
    }
    
    var body: some Scene {
        WindowGroup {
            ContentView()
        }
    }
}
