//
//  SequenceOpeningView.swift
//  runSomeWhere_1.0.1
//
//  Created by Yun Dongbeom on 2023/04/04.
//

import SwiftUI
import AVFoundation
import Combine

struct SequenceOpeningView: View {
    
    @EnvironmentObject
    var globalStore: GlobalStore
    
    @StateObject
    var sequenceOpeningStore = SequenceOpeningStore()
        
    typealias PlayerInfo = (Player, (Float, Float), (Float, Float))
        
    var staticCharcters: [PlayerInfo] = [
        (.Walker, (80.0, 550.0), (0.0, 0.0)),
        (.Luna, (80.0, 550.0), (0.0, 0.0)),
        (.Muho, (80.0, 550.0), (0.0, 0.0)),
        (.Coffee, (80.0, 550.0), (0.0, 0.0)),
        (.Olive, (80.0, 550.0), (0.0, 0.0)),
        (.Henry, (80.0, 550.0), (0.0, 0.0))
    ]
    
    var dynamicCharcters: [PlayerInfo] = [
    ]
    
    var body: some View {
        ZStack(alignment: .topLeading){
            if sequenceOpeningStore.isCharcterMove == false {
                ZStack{
                    CharacterView(objectName: .Walker, makeDirection: .Back_2, durationNumber: true,  start: (80.0, 550.0), end: (0.0, 0.0))
                    CharacterView(objectName: .Luna, makeDirection: CharcterDirection.Back_2, durationNumber: true, start: (124.0, 560.0), end: (0.0, 0.0))
                    CharacterView(objectName: .Muho, makeDirection: CharcterDirection.Back_2, durationNumber: true, start: (168.0, 540.0), end: (0.0, 0.0))
                    CharacterView(objectName: .Coffee, makeDirection: CharcterDirection.Back_2, durationNumber: true, start: (222.0, 560.0), end: (0.0, 0.0))
                    CharacterView(objectName: .Olive, makeDirection: CharcterDirection.Back_2, durationNumber: true, start: (266.0, 570.0), end: (0.0, 0.0))
                    CharacterView(objectName: .Henry, makeDirection: CharcterDirection.Back_2, durationNumber: true, start: (310.0, 540.0), end: (0.0, 0.0))
                }
                if sequenceOpeningStore.isBackgroundBlackActive {
                    Image("Background_Black")
                        .position(x: -100, y: -150)
                }
            } else if sequenceOpeningStore.isCharcterMove == true {
                ZStack{
                    CharacterView(objectName: .Walker, makeDirection: CharcterDirection.Back_1, durationNumber: true, start: (80.0, 550.0), end: (-20.0, -420.0))
                    CharacterView(objectName: .Luna, makeDirection: CharcterDirection.Back_1, durationNumber: true, start: (124.0, 560.0), end: (-10.0, -400.0))
                    CharacterView(objectName: .Muho, makeDirection: CharcterDirection.Back_1, durationNumber: true, start: (168.0, 540.0), end: (0.0, -370.0))
                    CharacterView(objectName: .Coffee, makeDirection: CharcterDirection.Back_1, durationNumber: true, start: (222.0, 560.0), end: (0.0, -410.0))
                    CharacterView(objectName: .Olive, makeDirection: CharcterDirection.Back_1, durationNumber: true, start: (266.0, 570.0), end: (20.0, -400.0))
                    CharacterView(objectName: .Henry, makeDirection: CharcterDirection.Back_1, durationNumber: true, start: (310.0, 540.0), end: (40.0, -370.0))
                }
            }
        }
        .onReceive(globalStore.$scriptCount, perform: { currentCount in
            sequenceOpeningStore.handleSequenceInteraction(scriptCount: currentCount)
        })
    }
}

struct SequenceOpeningView_Previews: PreviewProvider {
    static var previews: some View {
        SequenceOpeningView()
    }
}
