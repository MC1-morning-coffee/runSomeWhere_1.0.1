//
//  FaceView.swift
//  runSomeWhere_1.0.1
//
//  Created by Yun Dongbeom on 2023/04/04.
//

import SwiftUI

struct FaceView: View {
    
    @EnvironmentObject
    var sceneStore: SceneStore
    
    var direction = "left"
    var target = Speaker.coffee

    var body: some View {
        Image("\(sceneStore.faceViewSrcRoot)_\(target)".capitalized)
            .frame(width: sceneStore.faceViewSize.width, height: sceneStore.faceViewSize.height)
    }
}

struct FaceView_Previews: PreviewProvider {
    static var previews: some View {
        FaceView()
    }
}
