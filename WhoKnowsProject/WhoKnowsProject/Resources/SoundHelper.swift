//
//  SoundHelper.swift
//  WhoKnowsProject
//
//  Created by Baris Berkin Tasci on 11.01.2021.
//

import Foundation
import AVFoundation

class SoundHelper {
    static let sharedInstance = SoundHelper()
    
    let bg_music = URL(fileURLWithPath: Bundle.main.path(forResource: "bg-music", ofType: "mp3")!)
    var audioPlayer = AVAudioPlayer()
    
    func startBGMusic() {
        do {
            self.audioPlayer = try AVAudioPlayer(contentsOf: self.bg_music)
            self.audioPlayer.play()
        } catch {
            print("Could not load sound")
        }
    }
    
    func stopBGMusic() {
        if audioPlayer.isPlaying {
            self.audioPlayer.pause()
        }
    }
    
    func continueBGMusic() {
        audioPlayer.play()
    }
}
