//
//  QuizHanlder.swift
//  runSomeWhere_1.0.1
//
//  Created by Yun Dongbeom on 2023/04/04.
//

import Foundation

class QuizStore: ObservableObject {
    
    func handleSequenceQuizOne(globalStore: GlobalStore, scriptStore: ScriptStore, faceStore: FaceStore) {
        
        globalStore.turnOffIsQuizSequence()
        scriptStore.turnOnIsTapAble()
        faceStore.turnOnIsFaceViewActive()
        setTimeoutClosure(timeCount: 400) {
            globalStore.addScriptCount()
        }
    }
}
