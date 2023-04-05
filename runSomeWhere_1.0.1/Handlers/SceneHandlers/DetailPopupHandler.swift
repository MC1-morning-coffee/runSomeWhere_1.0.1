//
//  DetailPopupHandler.swift
//  runSomeWhere_1.0.1
//
//  Created by Yun Dongbeom on 2023/04/04.
//

import Foundation

class DetailPopupStore: ObservableObject {
    
    @Published
    var detailImageInfo = DETAIL_IMAGE_VIEW_INFO(size: CGSize(width: 290, height: 290), srcRoot: "Image")
    
    /**
     현재 디테일 이미지의 값을 변경하기 위한 변수
     */
    @Published
    var currentDetailImage: DetailImage = .Pouch
    
    @Published
    var isDetailPopupActive = false
}

extension DetailPopupStore {
    
    func updateCurrentDetailImage(detailImage: DetailImage) {
        currentDetailImage = detailImage
    }
    
    func toggleIsPopupActive() {
        isDetailPopupActive.toggle()
    }
    
    func turnOnIsPopupActive() {
        isDetailPopupActive = true
    }
    
    func turnOffIsPopupActive() {
        isDetailPopupActive = false
    }
}
