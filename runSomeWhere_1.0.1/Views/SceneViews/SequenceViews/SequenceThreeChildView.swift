//
//  SequenceThreeChildView.swift
//  runSomeWhere_1.0.1
//
//  Created by Yun Dongbeom on 2023/04/04.
//

import SwiftUI

struct SequenceThreeChildView: View {
    
    @Binding
    var isPeopleMoving1: Bool
    
    @Binding
    var isDrawingActive: Bool
    
    @Binding
    var isWoodFabricActive: Bool
    
    @Binding
    var isWoodMove: Bool

    @Binding
    var isFabricMove: Bool

    @Binding
    var isDrawingMove: Bool
    
    @Binding
    var isBoatActive: Bool
    
    @Binding
    var isPeopleMoving2: Bool
    
    @Binding
    var isPeopleOnBoat: Bool
    
    @Binding
    var isMagicCircleOn: Bool
    
    @State private var isWoodMoveActive = false
    @State private var isFabricMoveActive = false
    @State private var isDrawingMoveActive = false

    var body: some View {
        if isPeopleMoving1 {
            CharacterView(objectName: .Walker, makeDirection: CharcterDirection.Back_1, durationNumber: true, start: (50, 660), end: (0, -310))
            CharacterView(objectName: .Luna, makeDirection: CharcterDirection.Back_1, durationNumber: true, start: (90, 660), end: (0, -250))
            CharacterView(objectName: .Coffee, makeDirection: CharcterDirection.Back_1, durationNumber: true, start: (150, 660), end: (0, -220))
            CharacterView(objectName: .Muho, makeDirection: CharcterDirection.Back_1, durationNumber: true, start: (210, 660), end: (0, -215))
            CharacterView(objectName: .Olive, makeDirection: CharcterDirection.Back_1, durationNumber: true, start: (280, 660), end: (0, -260))
            CharacterView(objectName: .Henry, makeDirection: CharcterDirection.Back_1, durationNumber: true, start: (340, 660), end: (0, -300))
        }
        
        if isDrawingActive {
            Image("Object_Drawing")
                .position(x: 60, y: 250)
        }
        
        if isWoodFabricActive {
            Image("Object_Wood")
                .position(x: 310, y: 200)
            Image("Image_Fabric")
                .position(x: 280, y: 300)
        }
        
        if isWoodMove {
            Image("Object_Wood")
                .position(x: 310, y: 200)
                .offset(x: (isWoodMoveActive ? -100 : 0), y: (isWoodMoveActive ? 100 : 0))
                .onAppear {
                    withAnimation(.easeInOut(duration: 1)){
                        isWoodMoveActive.toggle()
                    }
                }
        }
        if isFabricMove {
            Image("Image_Fabric")
                .position(x: 280, y: 300)
                .offset(x: (isFabricMoveActive ? -100 : 0), y: (isFabricMoveActive ? -30 : 0))
                .onAppear {
                    withAnimation(.easeInOut(duration: 1)){
                        isFabricMoveActive.toggle()
                    }
                }
        }
        if isDrawingMove {
            Image("Object_Drawing")
                .position(x: 60, y: 250)
                .offset(x: (isDrawingMoveActive ? 120 : 0), y: (isDrawingMoveActive ? 50 : 0))
                .onAppear {
                    withAnimation(.easeInOut(duration: 1)){
                        isDrawingMoveActive.toggle()
                    }
                }
        }
        
        if isBoatActive {
            ShipView()
        }
        
        if isPeopleMoving2 {
            CharacterView(objectName: .Walker, makeDirection: CharcterDirection.Back_1, durationNumber: false, start: (50, 350), end: (100, -30))
            CharacterView(objectName: .Luna, makeDirection: CharcterDirection.Back_1, durationNumber: false, start: (90, 410), end: (70, -80))
            CharacterView(objectName: .Coffee, makeDirection: CharcterDirection.Back_1, durationNumber: false, start: (150, 440), end: (30, -100))
            CharacterView(objectName: .Muho, makeDirection: CharcterDirection.Back_1, durationNumber: false, start: (210, 445), end: (-20, -115))
            CharacterView(objectName: .Olive, makeDirection: CharcterDirection.Back_1, durationNumber: false, start: (280, 400), end: (-70, -60))
            CharacterView(objectName: .Henry, makeDirection: CharcterDirection.Back_1, durationNumber: false, start: (340, 360), end: (-110, -10))
        }
        
        if isPeopleOnBoat {
                        ShipPeopleView()
                    }
        
        if isMagicCircleOn {
            Image("Object_Magic")
                .position(x: 195, y: 400)
        }
        
    }
}
