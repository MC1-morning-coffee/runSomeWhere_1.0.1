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
        (.walker, (80.0, 550.0), (0.0, 0.0)),
        (.luna, (80.0, 550.0), (0.0, 0.0)),
        (.muho, (80.0, 550.0), (0.0, 0.0)),
        (.coffee, (80.0, 550.0), (0.0, 0.0)),
        (.olive, (80.0, 550.0), (0.0, 0.0)),
        (.henry, (80.0, 550.0), (0.0, 0.0))
    ]
    
    var dynamicCharcters: [PlayerInfo] = [
    ]
    
    var body: some View {
        ZStack(alignment: .topLeading){
            if sequenceOpeningStore.isCharcterMove == false {
                ZStack{
                    CharacterView(objectName: walker.name, makeDirection: CharcterDirection.Back_2, start: (80.0, 550.0), end: (0.0, 0.0))
                    CharacterView(objectName: luna.name, makeDirection: CharcterDirection.Back_2, start: (124.0, 560.0), end: (0.0, 0.0))
                    CharacterView(objectName: muho.name, makeDirection: CharcterDirection.Back_2, start: (168.0, 540.0), end: (0.0, 0.0))
                    CharacterView(objectName: coffee.name, makeDirection: CharcterDirection.Back_2, start: (222.0, 560.0), end: (0.0, 0.0))
                    CharacterView(objectName: olive.name, makeDirection: CharcterDirection.Back_2, start: (266.0, 570.0), end: (0.0, 0.0))
                    CharacterView(objectName: henry.name, makeDirection: CharcterDirection.Back_2, start: (310.0, 540.0), end: (0.0, 0.0))
                }
                if sequenceOpeningStore.isBackgroundBlackActive {
                    Image("Background_Black")
                        .position(x: -100, y: -150)
                }
            } else if sequenceOpeningStore.isCharcterMove == true {
                ZStack{
                    CharacterView(objectName: walker.name, makeDirection: CharcterDirection.Back_1, start: (80.0, 550.0), end: (-20.0, -420.0))
                    CharacterView(objectName: luna.name, makeDirection: CharcterDirection.Back_1, start: (124.0, 560.0), end: (-10.0, -400.0))
                    CharacterView(objectName: muho.name, makeDirection: CharcterDirection.Back_1, start: (168.0, 540.0), end: (0.0, -370.0))
                    CharacterView(objectName: coffee.name, makeDirection: CharcterDirection.Back_1, start: (222.0, 560.0), end: (0.0, -410.0))
                    CharacterView(objectName: olive.name, makeDirection: CharcterDirection.Back_1, start: (266.0, 570.0), end: (20.0, -400.0))
                    CharacterView(objectName: henry.name, makeDirection: CharcterDirection.Back_1, start: (310.0, 540.0), end: (40.0, -370.0))
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
