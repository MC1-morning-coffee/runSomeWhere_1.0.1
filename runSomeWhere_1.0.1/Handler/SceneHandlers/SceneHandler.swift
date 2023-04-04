//
//  SceneHandler.swift
//  runSomeWhere_1.0.1
//
//  Created by Yun Dongbeom on 2023/04/04.
//

import Foundation

class SceneStore: ObservableObject {
    private let faceViewInfo = FACE_VIEW_INFO(size: CGSize(width: 150, height: 200), srcRoot: "Face")
    
    init() {
        self.faceViewSize = faceViewInfo.size
    }
    
    @Published
    var faceViewSize: CGSize
    
}
