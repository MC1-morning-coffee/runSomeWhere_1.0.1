//
//  QuestionView.swift
//  runSomeWhere_1.0.1
//
//  Created by Yun Dongbeom on 2023/04/04.
//

import SwiftUI

struct QuestionView: View {
    
    @EnvironmentObject
    var globalStore: GlobalStore
    
//    @Binding var isStart: Bool

    let q = QUIZ_INFO["question"] ?? ""
    let q1 = QUIZ_INFO["question1"] ?? ""

    // QuizData에 있는 question값을 가져와서 String으로 형 변환해준다
    
    var body: some View {
        if globalStore.currentSequence == Sequence.sequence1 {
            CustomText(value: "\(q)", fontSize: 32, color: Color.black)
        }
        else {
            CustomText(value: "\(q1)", fontSize: 32, color: Color.black)
                
        }
    }
}


struct QuestionView_Previews: PreviewProvider {
    static var previews: some View {
        QuestionView()
    }
}
