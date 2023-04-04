//
//  QuizButtonViews.swift
//  runSomeWhere_1.0.1
//
//  Created by Yun Dongbeom on 2023/04/04.
//

import SwiftUI

struct QuizButtonView1: View {
    
    @EnvironmentObject
    var globalStore: GlobalStore
    
    @Environment(\.presentationMode) var presentation
    @Binding var isShowingModal: Bool
    @Binding var quizFalse: Bool

    var completion: ()->()
    
    var body: some View {
        LazyVGrid(columns: [GridItem(.flexible()), GridItem(.flexible())]) {
            Button{
                quizFalse.toggle()
            } label: {
                CustomText(value: "A", fontSize: 32, color: Color.black)
                    .frame(width: 180, height: 70)
                    .foregroundColor(.white)
                    .background(Color.clear)
            }.alert(isPresented: $quizFalse) {
                Alert(title: Text("틀렸습니다!"),
                      message: Text(""),
                      dismissButton: .default(Text("다시 풀어보기")))
            }
            .cornerRadius(15)
            Button {
                quizFalse.toggle()
            } label: {
                CustomText(value: "B", fontSize: 32, color: Color.black)
                    .frame(width: 180, height: 70)
                    .foregroundColor(.white)
                    .background(Color.clear)
            }
            .cornerRadius(15)
            Button {
                isShowingModal = false
                completion()
            } label: {
                CustomText(value: "C", fontSize: 32, color: Color.black)
                    .frame(width: 180, height: 70)
                    .foregroundColor(.white)
                    .background(Color.clear)
            }
            .cornerRadius(15)
            Button {
                quizFalse.toggle()
            } label: {
                CustomText(value: "D", fontSize: 32, color: Color.black)
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
        .offset(y: -24)
        .padding(.horizontal, 24)
    }
}
