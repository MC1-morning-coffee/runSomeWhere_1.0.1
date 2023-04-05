//
//  SelectCharcterView.swift
//  runSomeWhere_1.0.1
//
//  Created by Yun Dongbeom on 2023/04/04.
//

import SwiftUI

/**
 1. 스크립트 뷰를 덮는다.
 2. 클릭 시 무조건 `빨강`이  선택된다.
 */

struct SelectCharcterView: View {
    // TODO: change device width
    var width = CGFloat(390)
    
    @EnvironmentObject
    var globalStore: GlobalStore
    
    @EnvironmentObject
    var scriptStore: ScriptStore
    
    @EnvironmentObject
    var detailPopupStore: DetailPopupStore
    
    @EnvironmentObject
    var sceneStore: SceneStore
        
    private let SCRIPT_BOX_VIEW_BACKGROUND_IMAGE = "Background_Text"
    private let charcters: [Charcter] = [.walker, .coffee, .luna, .olive, .muho, .henry]
    
    private func handleSelectAnswer() {
        sceneStore.handleSequenceSelectCharcter(globalStore: globalStore, scriptStore: scriptStore, detailPopupStore: detailPopupStore)
    }
    
    private let gridColumns = [GridItem(),GridItem()]
    
    var body: some View {
        GeometryReader { geo in
            ZStack(alignment: .topLeading) {
                let offset = CGFloat(16)
                Image(SCRIPT_BOX_VIEW_BACKGROUND_IMAGE)
                    .zIndex(-1)
                    .offset(y: offset)
                LazyVGrid(columns: gridColumns) {
                    ForEach(Array(charcters.enumerated()), id: \.offset){ index, _charcters in
                        ButtonSelectCharcterView(charcter: _charcters, index: index) {
                            if _charcters == .coffee {
                                handleSelectAnswer()
                            }
                        }
                        .frame(minHeight: 48)
                    }                    .offset(y: 16)
                    .padding(.horizontal, 24)
                    .frame(maxHeight: .infinity)
                }
                .frame(maxHeight: .infinity)
            }
            .padding(16)
            .frame(width: width, height: scriptStore.scriptBoxHeight)
            .background(CustomColor.scriptBox)
        }
    }
}

// MARK: hello
struct SelectCharcterView_Previews: PreviewProvider {
    static var previews: some View {
        SelectCharcterView()
    }
}
