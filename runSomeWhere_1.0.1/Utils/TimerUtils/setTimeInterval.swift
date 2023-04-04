//
//  setTimeInterval.swift
//  runSomeWhere_1.0.1
//
//  Created by Yun Dongbeom on 2023/04/04.
//

import Foundation

//TODO: Coffee->Luna 유틸함수를 유틸스럽게 바꿔보면 좋을 것 같아요
public func setTimeIntervalClosure(Count: Int ,completion: @escaping ()->()) {
    if Count < 13 { // 12만큼만 수행
        DispatchQueue.main.asyncAfter(deadline: .now() + DispatchTimeInterval.milliseconds(250)) {
            completion()
            setTimeIntervalClosure(Count: Count + 1, completion: completion)
        }
    }

}
