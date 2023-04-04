//
//  CustomText.swift
//  runSomeWhere_1.0.1
//
//  Created by Yun Dongbeom on 2023/04/04.
//

import SwiftUI

struct CustomText: View {
    
    var value = ""
    var fontSize = 32
    var color = CustomColor.scriptColor
        
    var body: some View {
        Text(value)
            .font(Font.custom("morris9", size: CGFloat(fontSize)))
            .lineSpacing(8)
            .foregroundColor(color)
    }

}
