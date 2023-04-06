//
//  globalHandler.swift
//  runSomeWhere_1.0.1
//
//  Created by Yun Dongbeom on 2023/04/04.
//

import Foundation

class GlobalStore: ObservableObject {
    @Published
    var scriptCount = -1
    
    @Published
    var currentSequence: Sequence = .opeaning
    
    /**
     SafeArea의 값을 들고 있는 변수
     */
    @Published
    var safeAreaSize: SafeAreaSize = (0, 0) {
        didSet {
            print("safeArea top: ", safeAreaSize.0)
            print("safeArea btm: ", safeAreaSize.1)
        }
    }
    
    @Published
    var isSelectCharcterViewActive = false
    
    @Published
    var isQuizSequence = false
    
    @Published
    var isMovieStart = true
    
    @Published
    var paddleCount = 0
}

extension GlobalStore {
    func addScriptCount() {
        scriptCount += 1
    }
    
    func resetScriptCount() {
        scriptCount = 0
    }
}

extension GlobalStore {
    func updateCurrentSequence(sequence: Sequence) {
            currentSequence = sequence
    }
}

// safeAreaSize
extension GlobalStore {
    func updateSafeAreaSize(currentSafeAreaSize: SafeAreaSize) {
        safeAreaSize = currentSafeAreaSize
    }
}

extension GlobalStore {
    func turnOnIsSelectCharcterViewActive() {
        isSelectCharcterViewActive = true
    }
    
    func turnOffIsSelectCharcterViewActive() {
        isSelectCharcterViewActive = false
    }
}

extension GlobalStore {
    func turnOffIsQuizSequence() {
        isQuizSequence = false
    }
}

extension GlobalStore {
    func addPaddleCount() {
        paddleCount += 1
    }
}

extension GlobalStore {
    func turnOffIsMovieStart() {
        isMovieStart = false
        scriptCount = 0
    }
}
