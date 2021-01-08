//
//  SettingsPageViewController.swift
//  WhoKnowsProject
//
//  Created by Baris Berkin Tasci on 7.01.2021.
//

import UIKit

class AppSettingsPageViewController: UIViewController {

    // MARK: - OUTLETS
    
    @IBOutlet weak var titleLabel: BaseLightBlueLabel!
    @IBOutlet weak var soundLabel: UILabel!
    @IBOutlet weak var soundSwitch: UISwitch!
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
    }
    
    func prepareLayers() {
        titleLabel.prepareLabel()
        titleLabel.setLabelText(text: "SETTINGS")
        
        resetSettingsButton.prepareButton()
        resetSettingsButton.setButtonTitle(title: "Reset Defaults")
    }
    
    
    // MARK: - ACTIONS
    
    @IBAction func soundSwitchChanged(_ sender: Any) {
        // fon müziğini kapat
        // arkaplan animasyonunu kapat
    }
    
    @IBAction func resetSettingsButtonTouched(_ sender: Any) {
    }
    
}
