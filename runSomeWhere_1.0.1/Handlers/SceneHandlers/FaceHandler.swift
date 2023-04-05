//
//  FaceHandler.swift
//  runSomeWhere_1.0.1
//
//  Created by Yun Dongbeom on 2023/04/04.
//

import Foundation

class FaceStore: ObservableObject {
    
    @Published
    var faceViewInfo = FACE_VIEW_INFO(size: CGSize(width: 150, height: 200), srcRoot: "Face")
    
    @Published
    var currentFaces: [Speaker] = [.system]
    
    @Published
    var isFaceViewActive = false
    
    /**
     rightFaceView의 애니메이션 효과를 위한 값
     */
    @Published
    var rightFaceViewPositionX = 0.0
    
    /**
     leftFaceView의 애니메이션 효과를 위한 값
     */
    @Published
    var leftFaceViewPositionX = 0.0
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

/**
 FaceView 애니메이션
 */
extension FaceStore {
    func updateRightFaceViewPositionX(value: CGFloat) {
        rightFaceViewPositionX = value
    }
    
    func updateLeftFaceViewPositionX(value: CGFloat) {
        leftFaceViewPositionX = value
    }
}
