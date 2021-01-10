//
//  SettingsPageViewController.swift
//  WhoKnowsProject
//
//  Created by Baris Berkin Tasci on 7.01.2021.
//

import UIKit

class AppSettingsPageViewController: BaseFadedBlueViewController {

    // MARK: - OUTLETS
    
    @IBOutlet weak var soundLabel: UILabel!
    @IBOutlet weak var soundSwitch: UISwitch!
    @IBOutlet weak var backgroundEffectLabel: UILabel!
    @IBOutlet weak var backgroundEffectSwitch: UISwitch!
    @IBOutlet weak var resetSettingsButton: BaseBlueButton!
    
    // MARK: - PROPERTIES
    
    
    
    // MARK: - LIFE CYCLE METHODS
    
    override func viewDidLoad() {
        super.viewDidLoad()
        prepareUI()
    }
    
    // MARK: - PREPARE UI
    
    func prepareUI() {
        prepareLayers()
        prepareNavigationItems(title: "SETTINGS", backButtonTitle: "Home")
        
    }
    
    func prepareLayers() {
        resetSettingsButton.prepareBlueButton()
        resetSettingsButton.setButtonTitle(title: "RESET TO DEFAULTS")
    }
    
    // MARK: - ACTIONS
    
    @IBAction func soundSwitchChanged(_ sender: Any) {
        // fon müziğini kapat
    }
    
    @IBAction func backgroundEffectSwitchChanged(_ sender: Any) {
        // arkaplan animasyonunu kapat
    }
    
    @IBAction func resetSettingsButtonTouched(_ sender: Any) {
    }
    
}
