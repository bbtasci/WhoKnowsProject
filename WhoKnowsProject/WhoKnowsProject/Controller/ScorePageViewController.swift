//
//  NewScoreViewController.swift
//  WhoKnowsProject
//
//  Created by Baris Berkin Tasci on 7.01.2021.
//

import UIKit

class ScorePageViewController: BaseFadedBlueViewController {

    // MARK: - OUTLETS
    
    @IBOutlet weak var titleLabel: BaseLightBlueLabel!
    @IBOutlet weak var nameTitleLabel: BaseDarkBlueLabel!
    @IBOutlet weak var playerNameLabel: BaseDarkBlueLabel!
    @IBOutlet weak var trueTitleLabel: BaseDarkBlueLabel!
    @IBOutlet weak var trueNumberLabel: BaseDarkBlueLabel!
    @IBOutlet weak var totalPointsTitleLabel: BaseDarkBlueLabel!
    @IBOutlet weak var totalPointsLabel: BaseDarkBlueLabel!
    @IBOutlet weak var goToHomePageButton: BaseBlueButton!
    @IBOutlet weak var playAgainButton: BaseBlueButton!
    
    // MARK: - PROPERTIES
    
    var newPlayer = [PlayerModel]()
    var playerName: String = ""
    var totalPoints: Int = 0
    var totalTrueNumbers: Int = 0
    
    // MARK: - LIFE CYCLE METHODS
    
    override func viewDidLoad() {
        super.viewDidLoad()
        prepareUI()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(true)
        totalPointsLabel.text = String(totalPoints)
        trueNumberLabel.text = String(totalTrueNumbers)
        playerNameLabel.setLabelText(text: "\(playerName)")
    }
    
    // MARK: - PREPARE UI
    
    func prepareUI() {
        prepareLayers()
        prepareNavigationItems(title: "YOUR SCORE", backButtonTitle: "QUIZ")
        navigationItem.hidesBackButton = true
    }
    
    func prepareLayers() {
        titleLabel.prepareLabel()
        titleLabel.setLabelText(text: "END OF THE QUIZ")
        
        playerNameLabel.prepareLabel()
        nameTitleLabel.prepareLabel()
        nameTitleLabel.setLabelText(text: " Player Name")
        
        trueNumberLabel.prepareLabel()
        trueTitleLabel.prepareLabel()
        trueTitleLabel.setLabelText(text: " Total True Answers")
        
        totalPointsLabel.prepareLabel()
        totalPointsTitleLabel.prepareLabel()
        totalPointsTitleLabel.setLabelText(text: " Total Points")
        
        goToHomePageButton.prepareBlueButton()
        goToHomePageButton.setButtonTitle(title: "GO TO HOMEPAGE")
        
        playAgainButton.prepareBlueButton()
        playAgainButton.setButtonTitle(title: "PLAY AGAIN")
    }
    
    func saveScore() {
        
    }
    
    // MARK: - ACTIONS
    
    @IBAction func goToHomePageButtonTouched(_ sender: Any) {
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let homePageViewController = storyboard.instantiateViewController(identifier: "HomePageViewController") as! HomePageViewController
        self.navigationController?.pushViewController(homePageViewController, animated: true)
    }
    
    @IBAction func playAgainButtonTouched(_ sender: Any) {
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let quizSettingsPageViewController = storyboard.instantiateViewController(identifier: "QuizSettingsPageViewController") as! QuizSettingsPageViewController
        quizSettingsPageViewController.nameTextField.text = playerName
        self.navigationController?.pushViewController(quizSettingsPageViewController, animated: true)
    }
}
