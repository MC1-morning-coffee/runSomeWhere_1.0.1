//
//  setTimeout.swift
//  runSomeWhere_1.0.1
//
//  Created by Yun Dongbeom on 2023/04/04.
//

import Foundation

/**
 `timeCount`밀리초 후에 `completion`을 지연 동작 시키고 싶을 때 사용하는 클로저 함수
 
    - timeCount 1000  == 1초
    - timeCount 300 == 0.3초
 */
public func setTimeoutClosure(timeCount: Int, completion: @escaping ()->()) {
    DispatchQueue.main.asyncAfter(deadline: .now() + DispatchTimeInterval.milliseconds(timeCount)) {
        completion()
    }
}
