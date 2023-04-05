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
        currentScripts = script.SEQUENCE_OPENING_SCRIPTS
        currentSequenceCount = 0
        scriptBoxHeight = script.SCRIPT_BOX_HEIGHT
        cursorSize = script.CURSOR_SIZE
    }
    
    @Published
    var currentScripts: [Script.Script]
    
    @Published
    var scriptBoxHeight: CGFloat
    
    @Published
    var currentSequenceCount: Int
    
    @Published
    var cursorSize: CGFloat
    
    @Published
    var isTapAble = true
    
    @Published
    var isScriptBoxActive = true
    
    @Published
    var value = ""
    
    @Published
    var tmpText = ""
}

extension ScriptStore {
    func updateCurrentScripts(sequence: Sequence) {
        switch sequence {
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

/**
 스크립트 텍스트 업데이트 및 애니메이션
 */
extension ScriptStore {
    func typeWriter(at position: Int = 0) {
        // tmpText = ""
        if position == 0 {
            tmpText = ""
        }
        if position < value.count {
            DispatchQueue.main.asyncAfter(deadline: .now() + 0.05) {
                self.tmpText.append(self.value[position])
                self.typeWriter(at: position + 1)
            }
            
            if "\(tmpText)\(value[position])" == value {
                turnOnIsTapAble()
            }
        }
    }
    
    func updateScriptText(currentCount: Int) {
        turnOffIsTapAble()
        value = currentScripts[currentCount].1
        typeWriter()
    }
}

extension ScriptStore {
    
    func updateCurrentScript(globalStore: GlobalStore, scriptStore: ScriptStore, sceneStore: SceneStore, faceStore: FaceStore, quizStore: QuizStore, detailPopupStore: DetailPopupStore) {
        print(globalStore.scriptCount)
        
        if value.count > tmpText.count {
            return
        }
        if !isTapAble{
            return
        }
        if globalStore.scriptCount == currentScripts.count - 1 {
            currentSequenceCount += 1
            if currentSequenceCount > 4 {
                return
            }
            updateCurrentScripts(sequence: .allCases[currentSequenceCount])
            globalStore.updateCurrentSequence(sequence: .allCases[currentSequenceCount])
            globalStore.resetScriptCount()
        }else{
            globalStore.addScriptCount()
        }
        sceneStore.handleSequenceEvent(globalStore: globalStore, scriptStore: scriptStore, sceneStore: sceneStore, faceStore: faceStore, quizStore: quizStore, detailPopupStore: detailPopupStore)
    }
}

extension ScriptStore {
    
    func turnOnIsTapAble() {
        isTapAble = true
    }
    
    func turnOffIsTapAble() {
        isTapAble = false
    }
    
    func turnOnIsScriptBoxActive() {
        isScriptBoxActive = true
    }
    
    func turnOffIsScriptBoxActive() {
        isScriptBoxActive = false
    }
    
}
