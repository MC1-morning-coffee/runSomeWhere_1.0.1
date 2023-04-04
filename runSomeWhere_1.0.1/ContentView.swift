//
//  ContentView.swift
//  runSomeWhere_1.0.1
//
//  Created by Yun Dongbeom on 2023/04/04.
//

import SwiftUI
import AVFoundation

struct ContentView: View {
    
    @EnvironmentObject
    var globalStore: GlobalStore
        
    @EnvironmentObject
    var scriptStore: ScriptStore
    
    var body: some View {
        GeometryReader { geo in
            ZStack(alignment: .topLeading) {
                VStack(spacing: 0){
                    SceneView()
                if scriptStore.isScriptBoxActive {
                    ScriptBoxView(width: geo.size.width)
                    }
                }
                if globalStore.isSelectCharcterViewActive {
                    SelectCharcterView(width: geo.size.width)
                        .zIndex(1)
                        .offset(y: geo.size.height - scriptStore.scriptBoxHeight)
                }
                if globalStore.isQuizSequence {
                    QuizModalContainerView()
                        .offset(y: geo.size.height - scriptStore.scriptBoxHeight)
                        .frame(width: geo.size.width, height: scriptStore.scriptBoxHeight)
                }
                if globalStore.isMovieStart {
                    SequenceIntroView()
                        .onTapGesture {
                            globalStore.isMovieStart = false
                        }
                }
            }
        }

    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
            .previewDevice(PreviewDevice(rawValue: "iPhone 14"))
            .previewDisplayName("iPhone 14")
        
    }
}
