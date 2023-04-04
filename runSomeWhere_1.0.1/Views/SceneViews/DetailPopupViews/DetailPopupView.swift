//
//  DetailImageView.swift
//  runSomeWhere_1.0.1
//
//  Created by Yun Dongbeom on 2023/04/04.
//

import SwiftUI

struct DetailPopupView: View {
    
    @EnvironmentObject
    var detailPopupStore: DetailPopupStore
    
    var body: some View {
        Image("\(detailPopupStore.detailImageInfo.srcRoot)_\(detailPopupStore.currentDetailImage)")
            .frame(width: detailPopupStore.detailImageInfo.size.width, height: detailPopupStore.detailImageInfo.size.height)
    }
}

struct DetailPopupView_Previews: PreviewProvider {
    static var previews: some View {
        DetailPopupView()
    }
}
