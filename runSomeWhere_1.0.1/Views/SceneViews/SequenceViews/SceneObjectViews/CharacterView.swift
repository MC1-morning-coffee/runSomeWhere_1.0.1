//
//  CharacterView.swift
//  runSomeWhere_1.0.1
//
//  Created by Yun Dongbeom on 2023/04/04.
//

import SwiftUI

struct CharacterView: View {
    var objectName: Player // 오브젝트의 이름
    var makeDirection: CharcterDirection // 오브젝트 방향
    var durationNumber: Bool
    var start: (Float, Float) // 시작 위치
    var end: (Float, Float) // 끝 위치
    
    @State var imageNumber: Bool = false // true: 1, false: 2 이미지로 바꾸기
    @State var imageName: String = "" //이미지 이름 저장
    @State var imageOffset: Bool = false
    
    
    // name, direction -> imageName으로 변환
    func updateImage(name: Player, direction: CharcterDirection) -> String {
        return "\(name)_\(direction)"
        }
    
    
    var body: some View {
        
        VStack {
            Image(updateImage(name: objectName, direction: makeDirection))
                .position(x: CGFloat(start.0), y: CGFloat(start.1))
                .edgesIgnoringSafeArea(.all)
                .offset(x:  (imageOffset ? CGFloat(end.0) : 0), y: imageOffset ? CGFloat(end.1) : 0)
                .onAppear{
                    withAnimation(.linear(duration: durationNumber ? 1.5 : 3.0)){
                        self.imageOffset.toggle()
                    }
                    // .Back_1이면 뚜벅뚜벅 효과주기
                    if (makeDirection == CharcterDirection.Back_1){
                        setTimeIntervalClosure(Count: 0) {
                            if imageNumber {
                                imageNumber.toggle()
                                imageName = updateImage(name: objectName, direction: CharcterDirection.Back_2)
                            } else {
                                imageNumber.toggle()
                                imageName = updateImage(name: objectName, direction: CharcterDirection.Back_1)
                            }
                        }
                    }
                    // .Side_1이면 뚜벅뚜벅 효과주기
                    else if(makeDirection == CharcterDirection.Side_1){
                        // 12걸음만큼만 뚜벅거리기
                        setTimeIntervalClosure(Count: 0) {
                            if imageNumber{
                                imageNumber.toggle()
                                imageName = updateImage(name: objectName, direction: CharcterDirection.Side_2)
                            } else {
                                imageNumber.toggle()
                                imageName = updateImage(name: objectName, direction: CharcterDirection.Side_1)
                            }
                        }
                    }
                    else { // 뚜벅 X
                        imageName = updateImage(name: objectName, direction: makeDirection)
                    }
                }
        }
    }
}

struct CharacterView_Previews: PreviewProvider {
    static var previews: some View {
        CharacterView(objectName: .Coffee, makeDirection: .Back_1, durationNumber: false, start: (0, 0), end: (195, 422))
    }
}
