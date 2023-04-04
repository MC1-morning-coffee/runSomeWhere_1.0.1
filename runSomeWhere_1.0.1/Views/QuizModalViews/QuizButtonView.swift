//
//  QuizButtonView.swift
//  runSomeWhere_1.0.1
//
//  Created by Yun Dongbeom on 2023/04/04.
//

import SwiftUI

struct QuizButtonView: View {
    
    @EnvironmentObject
    var globalStore: GlobalStore
    @Environment(\.presentationMode) var presentation
    @Binding var isShowingModal: Bool
    @Binding var quizFalse: Bool

    var completion: ()->()
    
    var body: some View {
        LazyVGrid(columns: [GridItem(.flexible()), GridItem(.flexible())]) {
            Button{
                isShowingModal = false
                completion()
            } label: {
                CustomText(value: "O", fontSize: 32, color: Color.black)
                    .frame(width: 180, height: 70)
                    .foregroundColor(Color.clear)
                    .background(Color.clear)
            }.alert(isPresented: $quizFalse) {
                Alert(title: Text("틀렸습니다!"),
                      message: Text(""),
                      dismissButton: .default(Text("다시 풀어보기")))
            }
            .cornerRadius(15)
            Button {
                //print("hello")
                quizFalse.toggle()
            } label: {
                CustomText(value: "X", fontSize: 32, color: Color.black)
                    .frame(width: 180, height: 70)
                    .foregroundColor(.white)
                    .background(Color.clear)
            }.alert(isPresented: $quizFalse) {
                Alert(title: Text("틀렸습니다!"),
                      message: Text(""),
                      dismissButton: .default(Text("다시 풀어보기")))
            }
            .cornerRadius(15)
        }
        .offset(y: -32)
        .padding(.horizontal, 24)
    }
}
