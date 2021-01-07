//
//  SettingsPageViewController.swift
//  WhoKnowsProject
//
//  Created by Baris Berkin Tasci on 7.01.2021.
//

import UIKit

class AppSettingsPageViewController: UIViewController {

    // MARK: - OUTLETS
    
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var soundLabel: UILabel!
    @IBOutlet weak var soundSwitch: UISwitch!
    @IBOutlet weak var resetSettingsButton: UIButton!
    
    // MARK: - PROPERTIES
    
    
    
    // MARK: - LIFE CYCLE METHODS
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    // MARK: - PREPARE UI
    
    
    
    // MARK: - ACTIONS
    
    @IBAction func soundSwitchChanged(_ sender: Any) {
    }
    
    @IBAction func resetSettingsButtonTouched(_ sender: Any) {
    }
    
}
