//
//  SequenceOpeningHanlder.swift
//  runSomeWhere_1.0.1
//
//  Created by Yun Dongbeom on 2023/04/04.
//

import Foundation

class SequenceOpeningStore: ObservableObject {
    
    func handleSequenceSelectCharcter(globalStore: GlobalStore, scriptStore: ScriptStore, detailPopupStore: DetailPopupStore) {
        globalStore.turnOffIsSelectCharcterViewActive()
        detailPopupStore.turnOffIsPopupActive()
        scriptStore.turnOnIsTapAble()
        globalStore.addScriptCount()
    }
}
