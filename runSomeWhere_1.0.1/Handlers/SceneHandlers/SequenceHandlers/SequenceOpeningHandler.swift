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
            print("no event")
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
    var isStaticPlayersActive = false
    
    @Published
    var isDynamicPlayersActive = false
    
    
    @Published
    var staticPlayers = [
        PlayerInfo(user: .Walker, start: (80.0, 550.0), end: (0.0, 0.0)),
        PlayerInfo(user: .Luna, start: (124.0, 560.0), end: (0.0, 0.0)),
        PlayerInfo(user: .Muho, start: (168.0, 540.0), end: (0.0, 0.0)),
        PlayerInfo(user: .Coffee, start: (220.0, 560.0), end: (0.0, 0.0)),
        PlayerInfo(user: .Olive, start: (266.0, 570.0), end: (0.0, 0.0)),
        PlayerInfo(user: .Henry, start: (310.0, 540.0), end: (0.0, 0.0)),
    ]
    
    @Published
    var dynamicPlayers = [
        PlayerInfo(user: .Walker, start: (80.0, 550.0), end: (-20.0, -420.0)),
        PlayerInfo(user: .Luna, start: (124.0, 560.0), end: (-10.0, -400.0)),
        PlayerInfo(user: .Muho, start: (168.0, 540.0), end: (0.0, -370.0)),
        PlayerInfo(user: .Coffee, start: (220.0, 560.0), end: (0.0, -410.0)),
        PlayerInfo(user: .Olive, start: (266.0, 570.0), end: (20.0, -400.0)),
        PlayerInfo(user: .Henry, start: (310.0, 540.0), end: (40.0, -370.0)),
    ]
    
    func handleSequenceInteraction(scriptCount: Int) {
        switch scriptCount {
            
        case 3:
            setTimeoutClosure(timeCount: 1500) {
                self.isBackgroundBlackActive = false
                self.isStaticPlayersActive = true
            }
        case 11:
            setTimeoutClosure(timeCount: 200) {
                self.isStaticPlayersActive = false
            }
            self.isDynamicPlayersActive = true
        case 12:
            self.isDynamicPlayersActive = false
        default:
            print("scriptCount: ", scriptCount)
            
        }
    }
}
