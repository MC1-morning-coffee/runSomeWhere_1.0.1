//
//  AnswerView.swift
//  runSomeWhere_1.0.1
//
//  Created by Yun Dongbeom on 2023/04/04.
//

import SwiftUI

struct AnswerView: View {
    @EnvironmentObject
    var globalStore: GlobalStore
    // QuizData에 있는 question값을 가져와서 String으로 형 변환해준다
    
//    @Binding var isStart: Bool
    let answer: String = QUIZ_INFO["answer"] ?? ""
    let answer1: String = QUIZ_INFO["answer1"] ?? ""
    
    var body: some View {
        if globalStore.currentSequence == Sequence.sequence1 {
            CustomText(value: "\(answer)", fontSize: 28, color: Color.black)
                
        }
        else {
            CustomText(value: "\(answer1)", fontSize: 28, color: Color.black)
                .offset(y: -16)
                
        }
    }
}


struct AnswerView_Previews: PreviewProvider {
    static var previews: some View {
        AnswerView()
    }
}
