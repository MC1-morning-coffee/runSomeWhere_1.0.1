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
    
    var direction = "right"
    var target = Speaker.coffee
    
    var body: some View {
        GeometryReader { geo in
            let deviceWidth = geo.size.width
            let deviceHeight = geo.size.height
            
            let facePositionY = deviceHeight
            - faceStore.faceViewInfo.size.height
            
            Image("\(faceStore.faceViewInfo.srcRoot)_\(target)".capitalized)
                .frame(width: faceStore.faceViewInfo.size.width, height: faceStore.faceViewInfo.size.height)
                .animation(.linear(duration: 0.4), value: direction == "right"
                           ? faceStore.rightFaceViewPositionX
                           : faceStore.leftFaceViewPositionX)
                .offset(x: direction == "right"
                        ? faceStore.rightFaceViewPositionX
                        : faceStore.leftFaceViewPositionX, y: facePositionY)
                .onAppear {
                    direction == "right"
                    ? faceStore.updateRightFaceViewPositionX(value: deviceWidth - faceStore.faceViewInfo.size.width)
                    : faceStore.updateLeftFaceViewPositionX(value: 0)
                }
                .onDisappear{
                    direction == "right"
                    ? faceStore.updateRightFaceViewPositionX(value: deviceWidth)
                    : faceStore.updateLeftFaceViewPositionX(value: -faceStore.faceViewInfo.size.width)
                }
            
        }
    }
}

