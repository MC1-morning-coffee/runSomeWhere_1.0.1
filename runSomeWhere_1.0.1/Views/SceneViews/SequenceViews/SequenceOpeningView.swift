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
        
    var body: some View {
        ZStack(alignment: .topLeading){
            if sequenceOpeningStore.isStaticPlayersActive {
                ZStack{
                    ForEach(sequenceOpeningStore.staticPlayers, id: \.id) { playerInfo in
                        CharacterView(
                            objectName: playerInfo.user,
                            makeDirection: .Back_2,
                            durationNumber: false,
                            start: playerInfo.start,
                            end: playerInfo.end)
                        
                    }
                    if sequenceOpeningStore.isBackgroundBlackActive {
                        Image("Background_Black")
                            .position(x: -100, y: -150)
                    }
                }
            }
                if sequenceOpeningStore.isDynamicPlayersActive {
                    ZStack{
                        ForEach(sequenceOpeningStore.dynamicPlayers, id: \.id) { playerInfo in
                            CharacterView(
                                objectName: playerInfo.user,
                                makeDirection: .Back_1,
                                durationNumber: true,
                                start: playerInfo.start,
                                end: playerInfo.end)
                            
                        }
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
