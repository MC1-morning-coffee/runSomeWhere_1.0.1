//
//  ScriptBoxView.swift
//  runSomeWhere_1.0.1
//
//  Created by Yun Dongbeom on 2023/04/04.
//

import SwiftUI

/**
 필요한 기능
1. 탭 클릭 시 스크립트가 변경된다.
2. 스크립트가 타이핑효과로 나타난다.
3. 스크립트가 다 나타나면 커서가 깜빡이며 탭 클릭이 가능하다.
 */
struct ScriptBoxView: View {
    @EnvironmentObject
    var globalStore: GlobalStore
    
    @EnvironmentObject
    var scriptStore: ScriptStore
    
    @EnvironmentObject
    var sceneStore: SceneStore
    
    @EnvironmentObject
    var faceStore: FaceStore
    
    @EnvironmentObject
    var quizStore: QuizStore
    
    @EnvironmentObject
    var detailPopupStore: DetailPopupStore
    
    @State
    private var isFlickering = false
    
    var width: CGFloat
                
    private let SCRIPT_BOX_VIEW_BACKGROUND_IMAGE = "Background_Text"
    
    var body: some View {
        ZStack(alignment: .topLeading) {
            let offset = CGFloat(16)
            // Background Image
            Image(SCRIPT_BOX_VIEW_BACKGROUND_IMAGE)
                .zIndex(-1)
                .offset(y: offset)
            // Cursor Pointer
            CursorView()
                .frame(width: scriptStore.cursorSize, height: scriptStore.cursorSize)
                .offset(x: width - scriptStore.cursorSize - offset , y: scriptStore.scriptBoxHeight - scriptStore.cursorSize)
            VStack(alignment: .leading) {
                    HStack(spacing: 0){
                        VStack(alignment: .leading, spacing: 0){
                            CustomText(value: "\(scriptStore.tmpText)")
                        }
                        .padding(24)
                        Spacer()
                    }
                    .offset(y: 20)
            }
            .zIndex(10)
        }
        .padding(16)
        .frame(width: width, height: scriptStore.scriptBoxHeight)
        .background(CustomColor.scriptBox)
        .onTapGesture {
            scriptStore.updateCurrentScript(globalStore: globalStore, scriptStore: scriptStore, sceneStore: sceneStore, faceStore: faceStore, quizStore: quizStore, detailPopupStore: detailPopupStore)
        }
        .onReceive(globalStore.$scriptCount, perform: { currentCount in
            scriptStore.updateScriptText(currentCount: currentCount)
        })
    }
}
