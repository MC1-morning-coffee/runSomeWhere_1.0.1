//
//  ScriptModel.swift
//  runSomeWhere_1.0.1
//
//  Created by Yun Dongbeom on 2023/04/04.
//

import Foundation

struct Script {
    typealias Script = ([Speaker], String)
    
    let SCRIPT_BOX_HEIGHT = CGFloat(194)
    let CURSOR_SIZE = CGFloat(80)
    
    let SEQUENCE_OPENING_SCRIPTS: [Script] = [
        ([Speaker.system],
        "모든 것이 평화롭던 어느날..."
        ),
        ([Speaker.system],
        "외딴 섬에 떨어지게된 6명의 러너들,"
        ),
        ([Speaker.system],
        "그들에게는 이 섬을 탈출하기 위한 미션이 주어지는데..."
        ),
        ([Speaker.system],
        "쿠와아아앙!!!!!"
        ),
        ([Speaker.system],
        "하늘에서 갑자기 사람들이 떨어졌다!"
        ),
        ([Speaker.unknown],
        "아야..!"
        ),
        ([Speaker.unknown],
        "어라... 여기가 어디지...?"
        ),
        ([Speaker.unknown],
        "CB...L?? 뭘 어떻게 하라는거야..!!"
        )
        ,
        ([Speaker.unknown],
        "주머니에 열쇠가 들어있어!"
        ),
        ([Speaker.unknown],
        "어떤 열쇠를 고르지...?"
        ),
        ([Speaker.unknown],
        "저 앞에 문으로 나가야 하나봐...!"
        ),
        ([Speaker.system],
        "터벅터벅....."
        ),
        ([Speaker.unknown],
        "철컥... 문이 열렸다!"
        ),
    ]
    let SEQUENCE_ONE_SCRIPTS: [Script] = [
        ([Speaker.system],
        "걷는 중..."
        ),
        ([Speaker.coffee],
        "저게 뭐지...?"
        ),
        ([Speaker.system],
        " "
        ),
        ([Speaker.coffee],
        "커피: 앗! 물이 쫄쫄 나오는 정수기에 앞이 막혀있다..."
        ),
        ([Speaker.coffee],
        "커피: 이런... 얼른 지나가야 할텐데..."
        ),
        ([Speaker.system],
        " "
        ),
        ([Speaker.coffee],
        "커피: 쫄쫄 나오는 정수기가 사라졌다...! 이건 껌easy!!"
        ),
        ([Speaker.system],
        "부스럭...부스럭..."
        ),
        ([Speaker.coffee, Speaker.muho],
        "무호: 문제를 풀었구나 커피!! 같이 가자!!"
        ),
        ([Speaker.coffee, Speaker.muho],
        "커피: 그래, 같이 가자 무호!"
        ),
    ]
    let SEQUENCE_TWO_SCRIPTS: [Script] = [
        ([Speaker.system],
        "걷는 중..."
        ),
        ([Speaker.coffee],
        "커피: 이번엔 또 뭐지?"
        ),
        ([Speaker.system],
        " "
        ),
        ([Speaker.coffee],
        "커피: 열려면 팔을 겁나 뻗어야하는 자동문이 있다!"
        ),
        ([Speaker.coffee],
        "커피: 이 버튼만 누르면 지나갈 수 있는건가...?"
        ),
        ([Speaker.system],
        "딸깍"
        ),
        ([Speaker.system],
        "지이잉..."
        ),
        ([Speaker.coffee],
        "커피: 뭐야! 이럴거면 왜 이런 데에 버튼이 있어?!"
        ),
        ([Speaker.system],
        " "
        ),
        ([Speaker.coffee],
        "커피: 문이 열렸다! GQ는 내가 좀 해봤지, 후후..."
        ),
        ([Speaker.muho],
        "무호: 커피...좀 치네...?"
        ),
        ([Speaker.coffee],
        "커피: 근데 저 문은 좀 바꿔야겠다..."
        ),
    ]
    let SEQUENCE_THREE_SCRIPTS: [Script] = [
        ([Speaker.system],
        " "
        ),
        ([Speaker.walker],
        "워커: 다들 문제 풀고 온 거야?"
        ),
        ([Speaker.luna],
         "루나: 다 끝난 줄 알았는데, 호수 때문에 못 지나가겠네?"
        ),
        ([Speaker.henry],
        "헨리: (너희 납치된거야…)"
        ),
        ([Speaker.muho],
        "무호: 어, 나 오는 길에\n배 도면을 발견했는데…이걸로 뭘 할 수 있을까?"
        ),
        ([Speaker.olive],
        "올리브: 나는 천, 헨리는 나무를 발견했어!"
        ),
        ([Speaker.coffee],
        "커피 : 그럼 배를 만들어볼까?"
        ),
        ([Speaker.unknown],
        "뚝딱뚝딱......"
        ),
        ([Speaker.system],
        "배가 만들어졌다!"
        ),
        ([Speaker.muho],
        "무호: 다들 배에 타봐!"
        ),
        ([Speaker.olive],
        "올리브: 앗, 그런데 바람이 너무 세서 앞으로 갈 수가 없어!"
        ),
        ([Speaker.luna,
         Speaker.walker],
        "루나,워커: 우리가 풍향을 바꿔보자!"
        ),
        ([Speaker.luna,
         Speaker.walker],
        "워커와 루나가 주문을 외우기 시작했다."
        ),
        ([Speaker.luna,
         Speaker.walker],
        "워커: Import UIkit\nvar wind = “North”"
        ),
        ([Speaker.luna,
         Speaker.walker],
        "루나: wind = direction..."
        ),
        ([Speaker.system],
        "바람의 방향이 남풍으로 바뀌었다!"
        ),
        ([Speaker.henry],
        "헨리: 좋아! 그런데,, 노는 어떻게 젓지?"
        ),
        ([Speaker.coffee],
        "커피: (조용히 손을 들며..) 제가 한 번…해보겠습니다…"
        ),
        ([Speaker.coffee],
        "커피: 노는 이렇게 젓는겁니다."
        ),
        ([Speaker.system],
        " "
        ),
        ([Speaker.unknown],
        "우와아아아아!!!!!!"
        ),
        ([Speaker.system],
        " "
        ),
        ([Speaker.coffee],
        "커피: 꺅!! 저건 누구지?"
        ),
        ([Speaker.gomisac],
        "곰이작: (머리를 넘기며) CBL을 생각보다 잘 완수했군요…"
        ),
        ([Speaker.gomisac],
        "곰이작: 이건 우리가 주는 선물이니 섬을 탈출하면 열어보세요..축하합니다."
        ),
        ([Speaker.unknown],
        "와~드디어 탈출했다~!!!!"
        ),
    ]
    let SEQUENCE_ENDING_SCRIPTS: [Script] = [
        ([Speaker.system],
        " "
        ),
        ([Speaker.muho],
        "무야호~~ 도착했다!"
        ),
        ([Speaker.unknown],
        "자 이제 열어볼까? 어떤 보물이지...?"
        ),
        ([Speaker.system],
        "6개의 열쇠를 꽂아서 보물상자를 열었다."
        ),
        ([Speaker.system],
        " "
        ),
        ([Speaker.system],
        " "
        ),
        ([Speaker.unknown],
        "어어어어!!!"
        ),
        ([Speaker.system],
        "강렬한 빛이 쏟아져나오며 여섯명이 또 다시 사라졌다."
        ),
        ([Speaker.system],
        "The end..."
        ),
    ]
}
