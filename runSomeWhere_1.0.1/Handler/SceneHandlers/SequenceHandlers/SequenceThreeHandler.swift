//
//  SequenceThreeHandler.swift
//  runSomeWhere_1.0.1
//
//  Created by Yun Dongbeom on 2023/04/04.
//

import Foundation

class SequenceThreeStore: ObservableObject {
    
    @Published
    var paddleCount = 0
}

extension SequenceThreeStore {
    func addPaddleCount() {
        paddleCount += 1
    }
}
