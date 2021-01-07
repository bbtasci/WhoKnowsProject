//
//  GamePageViewController.swift
//  WhoKnowsProject
//
//  Created by Baris Berkin Tasci on 7.01.2021.
//

import UIKit

class NewGameSettingsPageViewController: UIViewController {

    // MARK: - OUTLETS
    
    @IBOutlet weak var newGameInfoLabel: UILabel!
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var nameTextField: UITextField!
    @IBOutlet weak var categoryLabel: UILabel!
    @IBOutlet weak var categoryPickerView: UIPickerView!
    @IBOutlet weak var difficultyLabel: UILabel!
    @IBOutlet weak var difficultyPickerView: UIPickerView!
    @IBOutlet weak var startGameButton: UIButton!
    
    // MARK: - PROPERTIES
    
    
    
    // MARK: - LIFE CYCLE METHODS
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    // MARK: - PREPARE UI
    
    
    
    // MARK: - ACTIONS
    
    @IBAction func startGameButtonTouched(_ sender: Any) {
    }
    
}
