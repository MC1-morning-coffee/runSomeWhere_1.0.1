//
//  SoundModel.swift
//  runSomeWhere_1.0.1
//
//  Created by yusang on 2023/04/06.
//
import SwiftUI
import Foundation
import AVFoundation
import Combine

class Sound: ObservableObject {
    @State private var musicCount = 0
    private var backgroundMusicPlayer: AVPlayer?
    private var soundEffectPlayer: AVPlayer?
    private var currentPlayCount = 0
    
    var musicFileName = BGM().backgroundMusicFilesOp[0]
    var effectFileName = SoundEffect().soundEffectFilesOp[0]
}

extension Sound {
    
    func handleSound(globalStore: GlobalStore, scriptStore: ScriptStore, sceneStore: SceneStore) {
        switch globalStore.currentSequence {
        case .opeaning:
            musicFileName = BGM().backgroundMusicFilesOp[musicCount]
            effectFileName = SoundEffect().soundEffectFilesOp[musicCount]
        case .sequence1:
            musicFileName = BGM().backgroundMusicFiles1[musicCount]
            effectFileName = SoundEffect().soundEffectFiles1[musicCount]
        case .sequence2:
            musicFileName = BGM().backgroundMusicFiles2[musicCount]
            effectFileName = SoundEffect().soundEffectFiles2[musicCount]
        case .sequence3:
            musicFileName = BGM().backgroundMusicFiles3[musicCount]
            effectFileName = SoundEffect().soundEffectFiles3[musicCount]
        case .ending:
            musicFileName = BGM().backgroundMusicFilesEd[musicCount]
            effectFileName = SoundEffect().soundEffectFilesEd[musicCount]
        }
        
        let musicFileUrl = Bundle.main.url(forResource: musicFileName, withExtension: MusicBasic().musicFileExtension)!
        var backgroundMusicPlayer = AVPlayer(url: musicFileUrl)
        backgroundMusicPlayer.volume = MusicBasic().BgmVolume
        backgroundMusicPlayer.play()
        
        let effectFileUrl = Bundle.main.url(forResource: effectFileName, withExtension: MusicBasic().musicFileExtension)!
        soundEffectPlayer = AVPlayer(url: effectFileUrl)
        soundEffectPlayer?.volume = MusicBasic().EffectVolume
        soundEffectPlayer?.play()
    }
    
}
