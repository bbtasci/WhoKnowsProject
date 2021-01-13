//
//  SettingsPageViewController.swift
//  WhoKnowsProject
//
//  Created by Baris Berkin Tasci on 7.01.2021.
//

import UIKit
import AVFoundation

class AppSettingsPageViewController: BaseFadedBlueViewController {

    // MARK: - OUTLETS
    
    @IBOutlet weak var soundLabel: BaseLightBlueLabel!
    @IBOutlet weak var soundSwitch: UISwitch!
    @IBOutlet weak var resetSettingsButton: BaseBlueButton!
    
    // MARK: - PROPERTIES
    
    
    // MARK: - LIFE CYCLE METHODS
    
    override func viewDidLoad() {
        super.viewDidLoad()
        prepareUI()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        //self.soundSwitch.isOn = UserDefaults.standard.bool(forKey: "switchState")
    }
    
    // MARK: - PREPARE UI
    
    fileprivate func prepareUI() {
        prepareLayers()
        prepareNavigationItems(title: "SETTINGS", backButtonTitle: "Home")
    }
    
    fileprivate func prepareLayers() {
        soundLabel.prepareLabel()
        soundLabel.setLabelText(text: " Sound")
        resetSettingsButton.prepareBlueButton()
        resetSettingsButton.setButtonTitle(title: "RESET TO DEFAULTS")
    }
    
    // MARK: - ACTIONS
    
    @IBAction func soundSwitchChanged(_ sender: Any) {
        //UserDefaults.standard.set((sender as AnyObject).isOn, forKey: "switchState")
        if soundSwitch.isOn {
            SoundHelper.sharedInstance.continueBGMusic()
        } else {
            SoundHelper.sharedInstance.stopBGMusic()
        }
    }

    @IBAction func resetSettingsButtonTouched(_ sender: Any) {
        soundSwitch.setOn(true, animated: true)
        SoundHelper.sharedInstance.continueBGMusic()
    }
}
