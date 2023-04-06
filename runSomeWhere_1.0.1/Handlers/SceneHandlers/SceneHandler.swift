//
//  SceneHandler.swift
//  runSomeWhere_1.0.1
//
//  Created by Yun Dongbeom on 2023/04/04.
//

import Foundation

class SceneStore: ObservableObject {
    
    
    
    /**
    `globalStore.scriptCount`가 변할 때마다 발생하는 이벤트를 처리하기 위한 함수
     */
    func handleSequenceEvent(globalStore: GlobalStore, scriptStore: ScriptStore, sceneStore: SceneStore, faceStore: FaceStore, quizStore: QuizStore, detailPopupStore: DetailPopupStore) {
        switch globalStore.currentSequence {
        case .opeaning:
            handleSequenceOpening(globalStore: globalStore, scriptStore: scriptStore, sceneStore: sceneStore, faceStore: faceStore, quizStore: quizStore, detailPopupStore: detailPopupStore)
        case .sequence1:
            handleSequenceOne(globalStore: globalStore, scriptStore: scriptStore, sceneStore: sceneStore, faceStore: faceStore, quizStore: quizStore, detailPopupStore: detailPopupStore)
        case .sequence2:
            handleSequenceTwo(globalStore: globalStore, scriptStore: scriptStore, sceneStore: sceneStore, faceStore: faceStore, quizStore: quizStore, detailPopupStore: detailPopupStore)
        case .sequence3:
            handleSequenceThree(globalStore: globalStore, scriptStore: scriptStore, sceneStore: sceneStore, faceStore: faceStore, quizStore: quizStore, detailPopupStore: detailPopupStore)
        case .ending:
            handleSequenceEnding(globalStore: globalStore, scriptStore: scriptStore, sceneStore: sceneStore, faceStore: faceStore, quizStore: quizStore, detailPopupStore: detailPopupStore)
        }
    }
}
