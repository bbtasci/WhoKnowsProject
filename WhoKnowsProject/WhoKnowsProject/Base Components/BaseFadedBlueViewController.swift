//
//  BaseFadedBlueViewController.swift
//  WhoKnowsProject
//
//  Created by Baris Berkin Tasci on 8.01.2021.
//

import Foundation
import UIKit
import AVFoundation

class BaseFadedBlueViewController: UIViewController {
    
    let bg_music = URL(fileURLWithPath: Bundle.main.path(forResource: "bg-music", ofType: "mp3")!)
    var audioPlayer = AVAudioPlayer()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = UIColor( red: CGFloat(119/255.0), green: CGFloat(141/255.0), blue: CGFloat(169/255.0), alpha: CGFloat(1.0))
        self.navigationController?.navigationBar.barTintColor = UIColor(red: CGFloat(224/255.0), green: CGFloat(225/255.0), blue: CGFloat(221/255.0), alpha: CGFloat(1.0))
    }
    
    func prepareNavigationItems(title: String, backButtonTitle: String) {
        self.navigationItem.title = title
        self.navigationItem.backButtonTitle = backButtonTitle
    }
    
//    func startBGMusic() {
//        do {
//            self.audioPlayer = try AVAudioPlayer(contentsOf: self.bg_music)
//            self.audioPlayer.play()
//        } catch {
//            print("Could not load voice")
//        }
//    }
//    
//    func stopBGMusic() {
//        if audioPlayer.isPlaying {
//            self.audioPlayer.pause()
//        }
//    }
//    
//    func soundSwitchControl() {
//        if audioPlayer.isPlaying {
//            stopBGMusic()
//        } else {
//            audioPlayer.play()
//        }
//    }
//    
//    func continueMusic() {
//        if audioPlayer.isPlaying {
//            audioPlayer.play()
//        } else {
//            audioPlayer.play()
//        }
//    }
    
}
