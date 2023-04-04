//
//  UserModel.swift
//  runSomeWhere_1.0.1
//
//  Created by Yun Dongbeom on 2023/04/04.
//

import Foundation
import SwiftUI

enum Charcter {
    case coffee
    case walker
    case luna
    case henry
    case muho
    case olive
}

extension Charcter {
    var personalColor: String {
        switch self {
        case .coffee:
            return "빨강"
        case .walker:
            return "초록"
        case .luna:
            return "노랑"
        case .henry:
            return "파랑"
        case .muho:
            return "주황"
        case .olive:
            return "보라"
        }
    }
    
    var personalUIColor: UIColor {
        switch self {
        case .coffee:
            return .red
        case .walker:
            return .green
        case .luna:
            return .yellow
        case .henry:
            return .blue
        case .muho:
            return .orange
        case .olive:
            return .purple
        }
    }
}


// User 각각 object들에 대한 정보를 저장하는 structure
struct User {
    var id: Int // 유저의 고유한 아이디
    var name: String
    var direction: CharcterDirection
    var isShown: Bool // true일때만 화면 상에 보여줌
    var coord: (Float, Float) // 오브젝트들의 위치
}

// 모든 user에 대한 정보

var henry = User(id: 1, name: "Henry_", direction: CharcterDirection.Front, isShown: false, coord: (100.0, 100.0))
var olive = User(id: 2, name: "Olive_", direction: CharcterDirection.Front, isShown: false, coord: (100.0, 100.0))
var luna = User(id: 3, name: "Luna_", direction: CharcterDirection.Back_1, isShown: true, coord: (100.0, 100.0))
var muho = User(id: 4, name: "Muho_", direction: CharcterDirection.Front, isShown: false, coord: (100.0, 100.0))
var coffee = User(id: 5, name: "Coffee_", direction: CharcterDirection.Front, isShown: false, coord: (100.0, 100.0))
var walker = User(id: 6, name: "Walker_", direction: CharcterDirection.Front, isShown: false, coord: (100.0, 100.0))
