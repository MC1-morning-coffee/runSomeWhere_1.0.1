//
//  QuizModalViews.swift
//  runSomeWhere_1.0.1
//
//  Created by Yun Dongbeom on 2023/04/04.
//

import SwiftUI

/**
 1. `쫄쫄이`, `동문이`와 상호작용 시 열린다.
 2. `Picker` or `Button`을 사용하여 정답을 선택할 수 있다.
 3. 정답 클릭 시 닫힌다.
 */
@available(iOS 16.0, *)
struct QuizModalView: View {
    var width = CGFloat(390)

    @EnvironmentObject
    var globalStore: GlobalStore
    
    @EnvironmentObject
    var scriptStore: ScriptStore
    
    @EnvironmentObject
    var faceStore: FaceStore
    
    @StateObject
    var quizStore = QuizStore()
    
    @State var isShowingModal: Bool = false
    // 모달 뷰를 중간까지만 띄우는 방법은 iOS16부터만 지원 가능..
    @State var quizFalse: Bool = false
    
    @State private var settingsDetent = PresentationDetent.medium

    @Environment(\.presentationMode) var presentation
        
    var body: some View {
        Button {
            isShowingModal = true
        } label: {
            Text("")
                .frame(width: width, height: scriptStore.scriptBoxHeight)
                .background(.opacity(0))
        }.sheet(isPresented: $isShowingModal) {
            //Text("modal view")
            ZStack{
                Image(globalStore.currentSequence == Sequence.sequence1 ? "Quiz_1" : "Quiz_2" )
                    .offset(y: globalStore.safeAreaSize.1 / 2)
                VStack (alignment: .leading){
                    Spacer()
                    QuestionView()
                        .padding(.horizontal, 24)
                        .offset(y: 16)
                    Spacer(minLength: 24)
                    AnswerView()
                        .padding(.horizontal, 24)
                    Spacer()
                    if globalStore.currentSequence == Sequence.sequence1 {
                        QuizButtonView1(isShowingModal: $isShowingModal, quizFalse: $quizFalse, completion: {
                            quizStore.handleSequenceQuizOne(globalStore: globalStore, scriptStore: scriptStore, faceStore: faceStore)
                        })
                    }
                    else {
                        QuizButtonView(isShowingModal: $isShowingModal, quizFalse: $quizFalse, completion: {
                            quizStore.handleSequenceQuizOne(globalStore: globalStore, scriptStore: scriptStore, faceStore: faceStore)
                        })
                    }
                }
            }
            .background(CustomColor.scriptBox)
            .presentationDetents([.medium, .large], selection: $settingsDetent)
        }
        .onAppear{
            setTimeoutClosure(timeCount: 100) {
                isShowingModal = true
            }
        }
    }
}
