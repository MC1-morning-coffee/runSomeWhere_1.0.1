//
//  SequenceBlinkView.swift
//  runSomeWhere_1.0.1
//
//  Created by Yun Dongbeom on 2023/04/04.
//

import SwiftUI

struct SequenceBlinkView: View {
    let introImages = ["Background_Blink_1", "Background_Blink_2"]
    
    @State private var currentImageIndex = 0
    
    var body: some View {
        Image(introImages[currentImageIndex])
            .ignoresSafeArea(.all)
            .onAppear {
                let timer = Timer.scheduledTimer(withTimeInterval: 0.08, repeats: true){ _ in
                    currentImageIndex = (currentImageIndex + 1) % introImages.count
                }
                DispatchQueue.main.asyncAfter(deadline: .now() + 1) {
                    timer.invalidate()
                }
            }
    }
}


struct SequenceBlinkView_Previews: PreviewProvider {
    static var previews: some View {
        SequenceBlinkView()
    }
}
