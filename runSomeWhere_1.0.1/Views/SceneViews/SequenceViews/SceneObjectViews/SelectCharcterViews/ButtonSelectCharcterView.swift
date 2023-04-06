//
//  ButtonSelectCharcterView.swift
//  runSomeWhere_1.0.1
//
//  Created by Yun Dongbeom on 2023/04/04.
//

import SwiftUI

struct ButtonSelectCharcterView: View {
    
    @State
    var charcter: Player = .coffee
    var index: Int
    var completion: () -> Void = {print("Hello")}
    
    init(charcter: Player = .coffee, index: Int, completion: @escaping ()->Void) {
        self.charcter = charcter
        self.completion = completion
        self.index = index
    }
    
    var body: some View {
        Button {
            completion()
        } label: {
            CustomText(value: "\(index + 1). \(charcter.keyColor)", color: CustomColor.scriptColor)
                .frame(minWidth: 0, maxWidth: .infinity, maxHeight: .infinity)
        }
        .frame(minWidth: 0, maxWidth: .infinity ,maxHeight: .infinity)
    }
}
