//
//  runSomeWhere_1_0_1App.swift
//  runSomeWhere_1.0.1
//
//  Created by Yun Dongbeom on 2023/04/04.
//

import SwiftUI

@main
struct runSomeWhere_1_0_1App: App {

    let globalStore = GlobalStore()
    let scriptStore = ScriptStore()
    let sceneStore = SceneStore()
    let faceStore = FaceStore()
    let quizStore = QuizStore()
    let detailPopupStore = DetailPopupStore()
        
    var body: some Scene {
        WindowGroup {
            ContentView()
                .environmentObject(globalStore)
                .environmentObject(scriptStore)
                .environmentObject(sceneStore)
                .environmentObject(faceStore)
                .environmentObject(quizStore)
                .environmentObject(detailPopupStore)
                .onAppear{
                    let safeAreaSize = getSafeAreaSize()
                    globalStore.updateSafeAreaSize(currentSafeAreaSize: safeAreaSize)
            }
        }
    }
}
