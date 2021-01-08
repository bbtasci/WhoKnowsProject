//
//  ViewController.swift
//  WhoKnowsProject
//
//  Created by Baris Berkin Tasci on 6.01.2021.
//

import UIKit

class HomePageViewController: BaseFadedBlueViewController {

    // MARK: - OUTLETS
    
    @IBOutlet weak var logoImageView: UIImageView!
    @IBOutlet weak var informationLabel: BaseLightBlueLabel!
    @IBOutlet weak var goToQuizButton: BaseBlueButton!
    @IBOutlet weak var highScoresButton: BaseBlueButton!
    @IBOutlet weak var gameSettingsButton: BaseBlueButton!
    
    // MARK: - PROPERTIES
    
    
    // MARK: - LIFE CYCLE METHODS
    
    override func viewDidLoad() {
        super.viewDidLoad()
        prepareUI()
    }

    // MARK: - PREPARE UI
    
    func prepareUI() {
        prepareLayers()
        prepareNavigationItems()
    }
    func prepareLayers() {
        logoImageView.image = UIImage(named: "whoknows-label")
        
        informationLabel.prepareLabel()
        informationLabel.setLabelText(text: "Lets see how far you can go! \n Start quiz when you are ready.")
        
        goToQuizButton.prepareButton()
        goToQuizButton.setButtonTitle(title: "GO TO QUIZ")
        
        highScoresButton.prepareButton()
        highScoresButton.setButtonTitle(title: "HIGH SCORES")
        
        gameSettingsButton.prepareButton()
        gameSettingsButton.setButtonTitle(title: "SETTINGS")
    }
    
    func prepareNavigationItems() {
        navigationItem.title = "WHO KNOWS?"
        navigationItem.backButtonTitle = "Back"
    }
    
    // MARK: - ACTIONS
    
    @IBAction func goToQuizButtonTouched(_ sender: Any) {
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
        let appSettingsPageViewController = storyboard.instantiateViewController(identifier: "AppSettingsPageViewController") as! AppSettingsPageViewController
        self.navigationController?.pushViewController(appSettingsPageViewController, animated: true)
    }
    
}

