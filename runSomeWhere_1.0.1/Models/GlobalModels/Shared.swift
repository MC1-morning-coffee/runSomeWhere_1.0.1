//
//  shared.swift
//  runSomeWhere_1.0.1
//
//  Created by Yun Dongbeom on 2023/04/04.
//

import Foundation

enum Sequence: Int, CaseIterable {
//    case intro
    case opeaning
    case sequence1
    case sequence2
    case sequence3
    case ending
}

enum Speaker: CaseIterable {
    case system
    case unknown
    case gomisac
    case coffee
    case walker
    case luna
    case henry
    case muho
    case olive
    case joljol
    case autodoor
}

enum DetailImage: CaseIterable {
    case CBL
    case Pouch // 주머니에 열쇠가 들어있다.
    case Keys // 컬러스왑한 열쇠가 6개가 있다.
    case Redkey // 열쇠 중 1개(커피)를 선택한다.
    case Water
    case Door
    case Treasure
}


// 이미지를 교체하기 위한 EnumDirection
enum CharcterDirection: CaseIterable {
    case Front, Back_1, Back_2, Left, Right,Side_1, Side_2
}
