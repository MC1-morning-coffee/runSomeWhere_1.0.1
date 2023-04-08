//
//  SequenceOneHandler.swift
//  runSomeWhere_1.0.1
//
//  Created by Yun Dongbeom on 2023/04/04.
//

import Foundation

extension SceneStore {
    func handleSequenceOne(globalStore: GlobalStore, scriptStore: ScriptStore, sceneStore: SceneStore, faceStore: FaceStore, quizStore: QuizStore, detailPopupStore: DetailPopupStore) {
        let scriptCount = globalStore.scriptCount
        
        switch scriptCount {
            case 2:
                faceStore.turnOffIsFaceViewActive()
                detailPopupStore.turnOnIsPopupActive()
                detailPopupStore.updateCurrentDetailImage(detailImage: .Water)
            case 3:
                faceStore.turnOnIsFaceViewActive()
            /**
             쫄쫄이가 문제를 낸다
             */
            case 5:
                detailPopupStore.turnOffIsPopupActive()
                faceStore.turnOffIsFaceViewActive()
                globalStore.turnOnIsQuizSequence()
            /**
             쫄쫄이가 사라진다.
             */
            case 6:
                faceStore.turnOnIsFaceViewActive()
        default:
            print("no event")
        }
    }
}

class SequenceOneStore: ObservableObject {
    
}
