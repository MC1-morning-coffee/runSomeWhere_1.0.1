//
//  SequenceOpeningHanlder.swift
//  runSomeWhere_1.0.1
//
//  Created by Yun Dongbeom on 2023/04/04.
//

import Foundation

extension SceneStore {
    func handleSequenceOpening(globalStore: GlobalStore, scriptStore: ScriptStore, sceneStore: SceneStore, faceStore: FaceStore, quizStore: QuizStore, detailPopupStore: DetailPopupStore) {
        let scriptCount = globalStore.scriptCount
        switch scriptCount {
            case 7:
                detailPopupStore.updateCurrentDetailImage(detailImage: .CBL)
                detailPopupStore.turnOnIsPopupActive()
            case 8:
                detailPopupStore.updateCurrentDetailImage(detailImage: .Pouch)
            case 9:
                detailPopupStore.updateCurrentDetailImage(detailImage: .Keys)
                scriptStore.turnOffIsTapAble()
                globalStore.turnOnIsSelectCharcterViewActive()
            // case 10: 사용자가 버튼 클릭으로 상태 변경
        default:
            print("openingEvent is Ready")
        }
    }
    
    func handleSequenceSelectCharcter(globalStore: GlobalStore, scriptStore: ScriptStore, detailPopupStore: DetailPopupStore) {
        globalStore.turnOffIsSelectCharcterViewActive()
        detailPopupStore.turnOffIsPopupActive()
        scriptStore.turnOnIsTapAble()
        globalStore.addScriptCount()
    }
}

class SequenceOpeningStore: ObservableObject {
    
    @Published
    var isCharcterActive = false
    
    @Published
    var isBackgroundBlackActive = true
    
    @Published
    var isCharcterMove: Bool? = nil
    
    
    
    func handleSequenceInteraction(scriptCount: Int) {
        switch scriptCount {
            
        case 3:
            setTimeoutClosure(timeCount: 1500) {
                self.isBackgroundBlackActive = false
                self.isCharcterMove = false
            }
        case 11:
            self.isCharcterMove = true
        case 12:
            self.isCharcterMove = nil
        default:
            print("scriptCount: ", scriptCount)
            
        }
    }
}
