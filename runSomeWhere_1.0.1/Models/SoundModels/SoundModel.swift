import Foundation
import SwiftUI
import AVFoundation
import Combine

struct MusicBasic {
    let musicFileExtension = "wav" //파일 확장자
    let BgmVolume: Float = 0.1 //bgm 볼륨 설정
    let EffectVolume: Float = 0.3 //효과음 볼륨 설정
}

struct BGM {
    let backgroundMusicFilesOp = ["BGM_Adventure_Begin", "BGM_Adventure_mystery"] //오프닝에서 쓰일 bgm목록
    let backgroundMusicFiles1 = ["BGM_Adventure_Rest"] //sequence1에서 쓰일 bgm 목록
    let backgroundMusicFiles2 = ["BGM_Adventure_Rest"]
    let backgroundMusicFiles3 = ["BGM_Adventure_Explore"]
    let backgroundMusicFilesEd = ["BGM_PopPop"] // 엔딩 bgm 목록
}

struct SoundEffect {
    let soundEffectFilesOp = ["SFX_Opening_exp_medium6", "SFX_Opening_sounds_falling7", "SFX_Opening_sounds_powerup15", "SFX_Opening_lowhealth_alarmloop7", "SFX_Opening_sounds_powerup6", "SFX_Opening_sounds_button11", "SFX_Opening_movement_dooropen4", "Walk"] //오프닝에서 쓰일 효과음 목록
    
    let soundEffectFiles1 = ["SFX_SeqOne_sound_neutral6", "SFX_SeqOne_lowhealth_alarmloop7", "SFX_SeqOne_sound_neutral11", "SFX_SeqOne_alarm_loop6", "SFX_SeqOne_coin_double7", "Walk"] //sequence1에서 쓰일 효과음
    
    let soundEffectFiles2 = ["Walk", "SFX_SeqTwo_sound_nagger2", "SFX_SeqTwo_sounds_button6", "SFX_SeqTwo_interaction20", "SFX_SeqTwo_menu_move4", "SFX_SeqOne_sound_neutral11"]
    
    let soundEffectFiles3 = ["Walk", "SFX_SeqThree_sounds_powerup10", "SFX_SeqThree_coin_cluster3", "SFX_SeqThree_menu_select4", "SFX_SeqThree_sound_mechanicalnoise4", "SFX_SeqThree_lowhealth_alarmloop6", "SFX_SeqThree_sounds_fanfare3"]
    
    let soundEffectFilesEd = ["SFX_SeqEnd_coin_cluster8", "SFX_SeqEnd_sounds_fanfare1"] //엔딩 효과음 목록
    
}
