//
//  globalHandler.swift
//  runSomeWhere_1.0.1
//
//  Created by Yun Dongbeom on 2023/04/04.
//

import Foundation

class GlobalStore: ObservableObject {
    
    @Published
    var scriptCount = 0
}

extension GlobalStore {
    func addScriptCount() {
        scriptCount += 1
    }
    
    func resetScriptCount() {
        scriptCount = 0
    }
}
