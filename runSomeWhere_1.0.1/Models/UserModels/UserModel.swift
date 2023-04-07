//
//  UserModel.swift
//  runSomeWhere_1.0.1
//
//  Created by Yun Dongbeom on 2023/04/04.
//

import Foundation
import SwiftUI

enum Player {
    case Coffee
    case Walker
    case Luna
    case Henry
    case Muho
    case Olive
    case BigCoffee
    case BigMuho
}

extension Player {
    var keyColor: String {
        switch self {
        case .Coffee:
            return "빨강"
        case .Walker:
            return "초록"
        case .Luna:
            return "노랑"
        case .Henry:
            return "파랑"
        case .Muho:
            return "주황"
        case .Olive:
            return "보라"
        case .BigCoffee:
            return "빨강"
        case .BigMuho:
            return "주황"
        }
    }
}

// User 각각 object들에 대한 정보를 저장하는 structure
struct User {
    var id: Int // 유저의 고유한 아이디
    var name: Player
    var direction: CharcterDirection
    var start: (Float, Float)
    var end: (Float, Float)
}


struct PlayerInfo {
    let id = UUID()
    let user: Player
    let start: (Float, Float)
    let end: (Float, Float)
}
