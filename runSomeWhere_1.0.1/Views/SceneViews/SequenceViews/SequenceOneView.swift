//
//  SequenceOneView.swift
//  runSomeWhere_1.0.1
//
//  Created by Yun Dongbeom on 2023/04/04.
//

import SwiftUI
import AVFoundation
import Combine

/*시퀀스 원
 - BigCoffee_Back_1/2 걸음(12걸음 뒤 자동으로 멈춤)
 
 - Object_WaterPurifier 맵과 같이 내려온다.(3000ms, 도착지로부터 y = -650에서 출발)
 
 - Image_Water 팝업
 
 - Image_Water 사라짐
 
 - Quiz 1 나타남 > 이건 여기서 구현?
 
 - Quiz 1 사라짐 > 이건 여기서 구현?
 
 - BigMuho_Side_1/2 걸음(12걸음 뒤 자동으로 멈춤)
 
 */

struct SequenceOneView: View {
    @EnvironmentObject
    var globalStore: GlobalStore
    
    @StateObject
    var sequenceOneStore = SequenceOneStore()
    
    @State private var isCharacterMove = true
    @State private var isJolJol = false
    @State private var isJolJolMove = false
    @State private var isMuho = false
    
    @State private var currentCount = 0
    
    private func handleSequenceView(scriptCount: Int) {
        switch scriptCount {
        case 0:
            setTimeoutClosure(timeCount: 3000) {
                isJolJolMove = true
            }
        case 10, 11:
            isCharacterMove = false
            print("scriptCount", scriptCount)
            
            DispatchQueue.main.asyncAfter(deadline: .now() + 0.001) {
                isCharacterMove = true
            }
         // JolJol 나옴
//            isCharacterMove = false
//            print("scriptCount", scriptCount)
//
//            DispatchQueue.main.asyncAfter(deadline: .now() + 0.001) {
//                isCharacterMove = true
//            }
        case 3: // JolJol 움직임
//            isCharacterMove = false
            isJolJolMove = false
//            print("scriptCount", scriptCount)
//
//            DispatchQueue.main.asyncAfter(deadline: .now() + 0.001) {
//                isCharacterMove = true
//            }
            isJolJol = true
        case 7: // JolJol 없어짐
            isJolJol = false
            isJolJolMove = false
            isMuho = true
        default:
            print("scriptCount", scriptCount)
        }
    }
    
    var body: some View {
        ZStack(alignment: .topLeading){
            if sequenceOneStore.isPlayerMove {
                CharacterView(objectName: .BigCoffee, makeDirection: .Back_1, durationNumber: true, start: (195, 540), end: (0, 0))
            }
            
            if sequenceOneStore.isStaticJolJolActive {
                JolJolView(start: (195, 150), end: (0, 0), imageOffset: true)
            }
            if sequenceOneStore.isDynamicJolJolActive {
                JolJolView(start: (195, 150), end: (0, -150), imageOffset: true)
            }
            if sequenceOneStore.isMoonWalkMuhoActive {
                CharacterView(objectName: .BigMuho, makeDirection: .Side_1, durationNumber: true, start: (0, 440), end: (100, 0))
            }
            
        }
        .onReceive(globalStore.$scriptCount, perform: { currentCount in
            sequenceOneStore.handleSequenceInteraction(scriptCount: currentCount)
        })
    }
}

struct SequenceOneView_Previews: PreviewProvider {
    static var previews: some View {
        SequenceOneView()
    }
}
