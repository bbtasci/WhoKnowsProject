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
        prepareNavigationItems(title: "WHO KNOWS", backButtonTitle: "Home")
    }
    func prepareLayers() {
        logoImageView.image = UIImage(named: "WhoKnows-OpeningLabel")
        
        informationLabel.prepareLabel()
        informationLabel.setLabelText(text: "Lets see how far you can go!")
        
        goToQuizButton.prepareBlueButton()
        goToQuizButton.setButtonTitle(title: "GO TO QUIZ")
        
        highScoresButton.prepareBlueButton()
        highScoresButton.setButtonTitle(title: "HIGH SCORES")
        
        gameSettingsButton.prepareBlueButton()
        gameSettingsButton.setButtonTitle(title: "SETTINGS")
    }
    
    // MARK: - ACTIONS
    
    @IBAction func goToQuizButtonTouched(_ sender: Any) {
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let quizSettingsPageViewController = storyboard.instantiateViewController(identifier: "QuizSettingsPageViewController") as! QuizSettingsPageViewController
        self.navigationController?.pushViewController(quizSettingsPageViewController, animated: true)
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
