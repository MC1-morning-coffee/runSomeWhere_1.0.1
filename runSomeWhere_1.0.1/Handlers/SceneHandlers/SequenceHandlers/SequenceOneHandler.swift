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
            case 3:
                faceStore.turnOnIsFaceViewActive()
            case 5:
                faceStore.turnOffIsFaceViewActive()
            case 6:
                faceStore.turnOnIsFaceViewActive()
        default:
            print("no event")
        }
    }
}
