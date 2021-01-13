//
//  ViewController.swift
//  WhoKnowsProject
//
//  Created by Baris Berkin Tasci on 6.01.2021.
//

import UIKit

final class HomePageViewController: BaseFadedBlueViewController {

    // MARK: - OUTLETS
    
    @IBOutlet weak var howToPlayInformationButton: UIButton!
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
        SoundHelper.sharedInstance.startBGMusic()
    }
  
    // MARK: - PREPARE UI
    
    fileprivate func prepareUI() {
        prepareLayers()
        prepareNavigationItems(title: "WHO KNOWS", backButtonTitle: "Home")
        navigationItem.hidesBackButton = true
    }
    fileprivate func prepareLayers() {
        howToPlayInformationButton.tintColor = .white
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
    
    @IBAction func howToPlayInformationButtonTouched(_ sender: Any) {
        showInteractiveAlert(title: "HOW TO PLAY", message: "You have 10 seconds to answer. \n You may get questions as far as you answer right.")
    }
    
    
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
