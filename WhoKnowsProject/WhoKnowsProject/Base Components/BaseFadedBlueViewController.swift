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
    
    // MARK: - AUDIO PLAYER - BACKGROUND MUSIC DEFINING
    
    let bg_music = URL(fileURLWithPath: Bundle.main.path(forResource: "bg-music", ofType: "mp3")!)
    var audioPlayer = AVAudioPlayer()
    
    // MARK: - INITIAL BACKGROUND COLOR
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = UIColor( red: CGFloat(119/255.0), green: CGFloat(141/255.0), blue: CGFloat(169/255.0), alpha: CGFloat(1.0))
        self.navigationController?.navigationBar.barTintColor = UIColor(red: CGFloat(224/255.0), green: CGFloat(225/255.0), blue: CGFloat(221/255.0), alpha: CGFloat(1.0))
    }
    
    // MARK: - NAVIGATION ITEM SET METHOD
    
    func prepareNavigationItems(title: String, backButtonTitle: String) {
        self.navigationItem.title = title
        self.navigationItem.backButtonTitle = backButtonTitle
    }
    
    // MARK: - ACTIVITY INDICATOR
    
    var activityView : UIActivityIndicatorView = UIActivityIndicatorView(frame: CGRect(x: 0, y: 0, width: 50, height: 50)) as UIActivityIndicatorView
    
    func addActivityIndicator() {
        activityView.center = self.view.center
        activityView.hidesWhenStopped = true
        activityView.color = .black
        activityView.style = UIActivityIndicatorView.Style.large
        view.addSubview(activityView)
    }
    
    
    // MARK: - BLURRED BACKGROUND (FOR ACTIVITY INDICATOR) DURING REQUEST
    
     var darkBlur = UIBlurEffect()
     var blurView = UIVisualEffectView()
     
     func blurredBackground() {
         darkBlur = UIBlurEffect(style: UIBlurEffect.Style.systemUltraThinMaterialLight)
         blurView = UIVisualEffectView(effect: darkBlur)
         blurView.frame = view.bounds
         view.addSubview(blurView)
     }
     
     func disableBlur() {
         blurView.removeFromSuperview()
     }
}
