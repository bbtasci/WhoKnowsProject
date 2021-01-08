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
        prepareUI()
    }

    // MARK: - PREPARE UI
    
    func prepareUI() {
        prepareOutletsAndViewBackgroundColor()
        prepareNavigationItems()
    }
    func prepareOutletsAndViewBackgroundColor() {
        //logoImageView.image = ""
        informationLabel.isCarterBlueLabel()
        informationLabel.text = "WHO KNOWS?"
        startGameButton.isTrappedDarknessBlueButton()
        startGameButton.setTitle("Start-Quiz", for: .normal)
        highScoresButton.isTrappedDarknessBlueButton()
        highScoresButton.setTitle("High Scores", for: .normal)
        gameSettingsButton.isTrappedDarknessBlueButton()
        gameSettingsButton.setTitle("Settings", for: .normal)
        
        // Screen Background Color
        eveningHushBlueBackground()
    }
    
    func prepareNavigationItems() {
        navigationItem.title = "WHO KNOWS?"
        navigationItem.backButtonTitle = "Back"
    }
    
    // MARK: - ACTIONS
    
    @IBAction func startGameButtonTouched(_ sender: Any) {
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let newGameSettingsPageViewController = storyboard.instantiateViewController(identifier: "NewGameSettingsPageViewController") as! NewGameSettingsPageViewController
        self.navigationController?.pushViewController(newGameSettingsPageViewController, animated: true)
    }
    
    @IBAction func highScoresButtonTouched(_ sender: Any) {
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let highScorePageViewController = storyboard.instantiateViewController(identifier: "HighScorePageViewController") as! HighScorePageViewController
        self.navigationController?.pushViewController(highScorePageViewController, animated: true)
    }
    
    @IBAction func gameSettingsButtonTouched(_ sender: Any) {
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let newGameSettingsPageViewController = storyboard.instantiateViewController(identifier: "NewGameSettingsPageViewController") as! NewGameSettingsPageViewController
        self.navigationController?.pushViewController(newGameSettingsPageViewController, animated: true)
    }
    
    
}

