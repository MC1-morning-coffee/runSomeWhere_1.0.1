//
//  PaddleButtonView.swift
//  runSomeWhere_1.0.1
//
//  Created by Yun Dongbeom on 2023/04/04.
//

import SwiftUI

struct PaddleButtonView: View {
    
    @EnvironmentObject
    var globalStore: GlobalStore
    
    @State
    private var isOffsetActive = false
    
    private func handleOnTapGesture() {
        isOffsetActive = true
        DispatchQueue.main.asyncAfter(deadline: .now() + 0.02) {
            isOffsetActive = false
        }
        globalStore.addPaddleCount()
    }
    
    var body: some View {
        Image("Object_No")
            .fixedSize()
            .position(x: 195, y: 480)
            .offset(y: (isOffsetActive ? 15 : 0))
            .onTapGesture {
                handleOnTapGesture()
            }
        }
    }
