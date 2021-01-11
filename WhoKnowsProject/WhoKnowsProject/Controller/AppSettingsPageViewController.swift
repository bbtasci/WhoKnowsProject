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
        startBGMusic()
    }
    
    // MARK: - PREPARE UI
    
    func prepareUI() {
        prepareLayers()
        prepareNavigationItems(title: "SETTINGS", backButtonTitle: "Home")
    }
    
    func prepareLayers() {
        soundLabel.prepareLabel()
        soundLabel.setLabelText(text: " Sound")
        resetSettingsButton.prepareBlueButton()
        resetSettingsButton.setButtonTitle(title: "RESET TO DEFAULTS")
    }
    
    // MARK: - ACTIONS
    
    @IBAction func soundSwitchChanged(_ sender: Any) {
        soundSwitchControl()
    }

    @IBAction func resetSettingsButtonTouched(_ sender: Any) {
        soundSwitch.setOn(true, animated: true)
        continueMusic()
    }
}
