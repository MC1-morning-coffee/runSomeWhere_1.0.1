//
//  SceneBackgroundView.swift
//  runSomeWhere_1.0.1
//
//  Created by Yun Dongbeom on 2023/04/04.
//

import SwiftUI

enum EnumBackgrundImage: CaseIterable {
    case opening
    case sequence1
    case sequence3
    case ending
}

extension EnumBackgrundImage {
    var srcName: String {
        switch self {
        case .opening:
            return "Background_Image1"
        case .sequence1:
            return "Background_Image2"
        case .sequence3:
            return "Background_Image3"
        case .ending:
            return "Background_Ending"
        }
    }
    
    var imgHeight: Int {
        switch self {
        case .opening:
            return 650
        case .sequence1, .sequence3:
            return 2600
        case .ending:
            return 2500
        }
    }
}

struct SceneBackgroundView: View {
    
    @EnvironmentObject
    var globalStore: GlobalStore
    
    @EnvironmentObject
    var scriptStore: ScriptStore
    
    @EnvironmentObject
    var detailPopupStore: DetailPopupStore
    
    @EnvironmentObject
    var faceStore: FaceStore
    
    @State
    private var isBlurActive = true
    
    @State
    private var isLastSequenceImage = false
    
    @State
    var currentBg: EnumBackgrundImage = .opening {
        didSet {
            currentSceneHeight = currentBg.imgHeight
            currentSceneImage = currentBg.srcName
        }
    }
    
    @State
    private var currentSceneHeight = 0
    
    @State
    private var bgOffsetY = 0
    
    @State
    private var animationDuration = 3.0
    
    @State
    private var currentSceneImage = "" {
        didSet {
            print("currentSceneImage is ", currentSceneImage)
        }
    }
    
    @State
    private var isBlinkActive = false
    
    
    @State
    private var isLastScript = false
    
    func handleCurrentBackground(scriptCount: Int) {
        switch globalStore.currentSequence {
        case .opeaning:
            currentBg = .opening
            if scriptCount == 3 {
                isBlurActive = false
                setTimeoutClosure(timeCount: 100) {
                    isBlinkActive = true
                }
                setTimeoutClosure(timeCount: 1500) {
                    isBlinkActive = false
                }
            }
            if scriptCount == 12 {
                scriptStore.turnOffIsTapAble()
                setTimeoutClosure(timeCount: 400) {
                    isBlurActive = true
                }
                setTimeoutClosure(timeCount: 1000) {
                    scriptStore.turnOnIsTapAble()
                }
            }
        case .sequence1:
            currentBg = .sequence1
            if scriptCount == 0 {
                setTimeoutClosure(timeCount: 400) {
                    isBlurActive = false
                    bgOffsetY = 650
                }
            }
            if scriptCount == 10 {
                scriptStore.turnOffIsTapAble()
                setTimeoutClosure(timeCount: 400) {
                    isBlurActive = true
                    animationDuration = 0
                }
                setTimeoutClosure(timeCount: 500) {
                    faceStore.turnOffIsFaceViewActive()
                }
                setTimeoutClosure(timeCount: 1000) {
                    
                    scriptStore.turnOnIsTapAble()
                }
            }
        case .sequence2:
            if scriptCount == 0 {
                bgOffsetY = bgOffsetY + 650
                detailPopupStore.turnOffIsPopupActive()
                setTimeoutClosure(timeCount: 400) {
                    isBlurActive = false
                    animationDuration = 3.0
                }
            }
            
            if scriptCount == 2 {
                detailPopupStore.turnOnIsPopupActive()
            }
            if scriptCount == 11 {
                scriptStore.turnOffIsTapAble()
                setTimeoutClosure(timeCount: 400) {
                    isBlurActive = true
                }
                setTimeoutClosure(timeCount: 1000) {
                    scriptStore.turnOnIsTapAble()
                }
            }
            
        case .sequence3:
            currentBg = .sequence3
            if scriptCount == 0 {
                bgOffsetY = 0
                setTimeoutClosure(timeCount: 400) {
                    isBlurActive = false
                }
            }
            if scriptCount == 9 {
                bgOffsetY = bgOffsetY + 350
            }
            
            if scriptCount == 19 {
                scriptStore.turnOffIsTapAble()
            }
            if scriptCount == 21 {
                scriptStore.turnOnIsTapAble()
                    bgOffsetY = bgOffsetY + 300
            }
            if scriptCount == 25 {
                setTimeoutClosure(timeCount: 2000) {
                    isBlurActive = true
                    bgOffsetY = 0
                }
            }
        case .ending:
            currentBg = .ending
            if scriptCount == 0 {
                animationDuration = 0
                setTimeoutClosure(timeCount: 400) {
                    bgOffsetY = 104
                    scriptStore.turnOffIsScriptBoxActive()
                }
                isLastSequenceImage = true
                setTimeoutClosure(timeCount: 1000) {
                    isBlurActive = false
                    scriptStore.turnOffIsTapAble()
                    animationDuration = 12
                    bgOffsetY -= 104 + 1800 - Int(globalStore.safeAreaSize.1) - Int(globalStore.safeAreaSize.1)
                }
                setTimeoutClosure(timeCount: 12000) {
                    scriptStore.turnOnIsTapAble()
                    globalStore.addScriptCount()
                }
            }
            if scriptCount == 6 {
                isBlurActive = true
            }
            if scriptCount == 7 {
                isLastScript = true
            }
        }
    }

    var body: some View {
        ZStack(alignment: .bottom){
            
            if isBlinkActive {
                SequenceBlinkView()
                    .frame(width: CGFloat(390), height: 650)
                    .zIndex(100)
                
            }
            /**
             실제 배경 이미지
             */
            Image(currentSceneImage)
                    .resizable()
                    .aspectRatio(contentMode: .fill)
                    .frame(width: 390, height: 650, alignment: isLastSequenceImage ? .top : .bottom)
                    .offset(y: CGFloat(bgOffsetY))
                    .animation(.linear(duration: animationDuration), value: bgOffsetY)
                    .alignmentGuide(.bottom) { d in
                          d[.bottom]
                      }
            /**
             가려지는 레이어
             */
            Rectangle()
                .zIndex(100)
                .background(isLastScript ? Color.white : Color.black)
                .frame(width: CGFloat(390), height: 650)
                .opacity(isBlurActive ?  1 : 0)
                .animation(.easeInOut(duration: 1), value: isBlurActive)
            
        }
        .edgesIgnoringSafeArea(.all)
        .onReceive(globalStore.$scriptCount, perform: { currentCount in
            handleCurrentBackground(scriptCount: currentCount)
        })
        .onReceive(globalStore.$paddleCount, perform: { currentCount in
            if bgOffsetY < 1550 {
                bgOffsetY = bgOffsetY + currentCount * 2
            }
            
            if scriptStore.value == scriptStore.tmpText{
                if currentCount > 40 {
                    globalStore.addScriptCount()
                }
                
            }
        })
    }
}


struct SceneBackgroundView_Previews: PreviewProvider {
    static var previews: some View {
        SceneBackgroundView()
    }
}
