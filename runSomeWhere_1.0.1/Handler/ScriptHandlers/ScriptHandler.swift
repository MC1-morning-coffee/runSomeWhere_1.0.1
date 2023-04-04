//
//  ScriptHandler.swift
//  runSomeWhere_1.0.1
//
//  Created by Yun Dongbeom on 2023/04/04.
//

import Foundation

class ScriptStore: ObservableObject {
    private let script = Script()
    /**
     현재 씬에 대한 스크립트 정보
     */
    init() {
        self.currentScripts = script.SEQUENCE_OPENING_SCRIPTS
        self.scriptBoxHeight = script.SCRIPT_BOX_HEIGHT
    }
    
    @Published
    var currentScripts: [Script.Script]
    
    @Published
    var scriptBoxHeight: CGFloat
}

extension ScriptStore {
    func updateCurrentScripts(scene: Sequence) {
        switch scene {
        case .opeaning:
            currentScripts = script.SEQUENCE_OPENING_SCRIPTS
        case .sequence1:
            currentScripts = script.SEQUENCE_ONE_SCRIPTS
        case .sequence2:
            currentScripts = script.SEQUENCE_TWO_SCRIPTS
        case .sequence3:
            currentScripts = script.SEQUENCE_THREE_SCRIPTS
        case .ending:
            currentScripts = script.SEQUENCE_ENDING_SCRIPTS
        }
    }
}
