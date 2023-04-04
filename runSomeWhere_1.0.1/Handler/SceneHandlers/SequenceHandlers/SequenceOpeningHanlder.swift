//
//  SequenceOpeningHanlder.swift
//  runSomeWhere_1.0.1
//
//  Created by Yun Dongbeom on 2023/04/04.
//

import Foundation


class SequenceOpeningStore: ObservableObject {
    
    func handleSequenceSelectCharcter(globalStore: GlobalStore) {
        globalStore.turnOffIsSelectCharcterViewActive()
        globalStore.turnOffIsPopupActive() // false
        globalStore.addScriptCount()
        globalStore.turnOnIsTapAble()
    }
}
