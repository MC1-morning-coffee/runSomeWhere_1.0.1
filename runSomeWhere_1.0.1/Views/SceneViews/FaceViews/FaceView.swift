//
//  FaceView.swift
//  runSomeWhere_1.0.1
//
//  Created by Yun Dongbeom on 2023/04/04.
//

import SwiftUI

struct FaceView: View {
    
    @EnvironmentObject
    var faceStore: FaceStore
    
    var direction = "left"
    var target = Speaker.coffee

    var body: some View {
        Image("\(faceStore.faceViewInfo.srcRoot)_\(target)".capitalized)
            .frame(width: faceStore.faceViewInfo.size.width, height: faceStore.faceViewInfo.size.height)
    }
}

struct FaceView_Previews: PreviewProvider {
    static var previews: some View {
        FaceView()
    }
}
