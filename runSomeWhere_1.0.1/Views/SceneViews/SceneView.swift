//
//  SceneView.swift
//  runSomeWhere_1.0.1
//
//  Created by Yun Dongbeom on 2023/04/04.
//

import SwiftUI

struct SceneView: View {
    
    @EnvironmentObject
    var globalStore: GlobalStore
    
    @EnvironmentObject
    var sceneStore: SceneStore
    
    @EnvironmentObject
    var faceStore: FaceStore
    
    @EnvironmentObject
    var detailPopupStore: DetailPopupStore
    
    var body: some View {
        GeometryReader {
            geo in
            let deviceWidth = geo.size.width
            let deviceHeight = geo.size.height
            ZStack(alignment: .topLeading) {
                // SequenceViewContainer
                SceneBackgroundView()
                    .frame(width: deviceWidth, height: deviceHeight)
                HStack {
                    AnyView(setSequenceView(sequence: globalStore.currentSequence))
                }
                .frame(width: deviceWidth, height: deviceHeight)
                if detailPopupStore.isDetailPopupActive {
                    DetailPopupView()
                        .position(x: deviceWidth / 2, y: deviceHeight / 2)
                        .transition(.asymmetric(insertion: .opacity.animation(.linear(duration: 0.4)), removal: .opacity.animation(.linear(duration: 0.4))))
                }
                if faceStore.isFaceViewActive {
                    FaceView(target: faceStore.currentFaces[0]
                    )
                    if faceStore.currentFaces.count > 1 {
                        FaceView(direction: "left", target: faceStore.currentFaces[1])
                    }
                }
            }
            .frame(width: deviceWidth, height: deviceHeight)
            .background(Color.black)
            .onAppear{
                // MARK: faceView 최초 포지션 설정
                faceStore.updateRightFaceViewPositionX(value: deviceWidth)
                faceStore.updateLeftFaceViewPositionX(value: -faceStore.faceViewInfo.size.width)
            }
        }
    }
}

extension SceneView {
    private func setSequenceView(sequence: Sequence) -> any View {
        switch sequence {
        case .opeaning:
            return SequenceOpeningView()
        case .sequence1:
            return SequenceOneView()
        case .sequence2:
            return SequenceTwoView()
        case .sequence3:
            return SequenceThreeView()
        case .ending:
            return SequenceEndingView()
        }
    }
}

struct SceneView_Previews: PreviewProvider {
    static var previews: some View {
        SceneView()
    }
}
