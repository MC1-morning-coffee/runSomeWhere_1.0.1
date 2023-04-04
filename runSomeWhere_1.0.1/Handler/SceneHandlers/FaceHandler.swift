//
//  FaceHandler.swift
//  runSomeWhere_1.0.1
//
//  Created by Yun Dongbeom on 2023/04/04.
//

import Foundation

class FaceStore: ObservableObject {
    
    @Published
    var currentFaces: [Speaker] = [.system]
    
    @Published
    var isFaceViewActive = false
}

extension FaceStore {
    func updateCurrentFaces(currentSpeakers: [Speaker]) {
        currentFaces = currentSpeakers
    }
    
    func toggleIsFaceViewActive() {
        isFaceViewActive.toggle()
    }
    
    func turnOnIsFaceViewActive() {
        isFaceViewActive = true
    }
    
    func turnOffIsFaceViewActive() {
        isFaceViewActive = false
    }
}
