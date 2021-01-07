//
//  ViewController.swift
//  WhoKnowsProject
//
//  Created by Baris Berkin Tasci on 6.01.2021.
//

import UIKit

class HomePageViewController: UIViewController {

    // MARK: - OUTLETS
    
    @IBOutlet weak var logoImageView: UIImageView!
    @IBOutlet weak var informationLabel: UILabel!
    @IBOutlet weak var startGameButton: UIButton!
    @IBOutlet weak var highScoresButton: UIButton!
    @IBOutlet weak var gameSettingsButton: UIButton!
    
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
    
    @IBAction func highScoresButtonTouched(_ sender: Any) {
    }
    
    @IBAction func gameSettingsButtonTouched(_ sender: Any) {
    }
    
    
}

