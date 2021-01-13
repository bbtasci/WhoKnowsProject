//
//  NewScoreViewController.swift
//  WhoKnowsProject
//
//  Created by Baris Berkin Tasci on 7.01.2021.
//

import UIKit

final class ScorePageViewController: BaseFadedBlueViewController {

    // MARK: - OUTLETS
    
    @IBOutlet weak var titleLabel: BaseLightBlueLabel!
    @IBOutlet weak var nameTitleLabel: BaseDarkBlueLabel!
    @IBOutlet weak var playerNameLabel: BaseDarkBlueLabel!
    @IBOutlet weak var trueTitleLabel: BaseDarkBlueLabel!
    @IBOutlet weak var trueNumberLabel: BaseDarkBlueLabel!
    @IBOutlet weak var totalPointsTitleLabel: BaseDarkBlueLabel!
    @IBOutlet weak var totalPointsLabel: BaseDarkBlueLabel!
    @IBOutlet weak var goToHomePageButton: BaseBlueButton!

    // MARK: - PROPERTIES
    
    var player = PlayerModel()
    var totalPoints: Int = 0
    var totalTrueNumbers: Int = 0
    
    // MARK: - LIFE CYCLE METHODS
    
    override func viewDidLoad() {
        super.viewDidLoad()
        prepareUI()
        checkHighScore()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(true)
        totalPointsLabel.text = String(totalPoints)
        trueNumberLabel.text = String(totalTrueNumbers)
        playerNameLabel.setLabelText(text: "\(player.name)")
    }
    
    // MARK: - PREPARE UI
    
    fileprivate func prepareUI() {
        prepareLayers()
        setDateForPlayer()
        //prepareNavigationItems(title: "YOUR SCORE", backButtonTitle: "QUIZ")
        navigationItem.hidesBackButton = true
    }
    
    fileprivate func prepareLayers() {
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
    }
    
    fileprivate func setDateForPlayer() {
        let today = Date()
        let formatter = DateFormatter()
        formatter.dateStyle = .short
        player.dateOfPlay = formatter.string(from: today)
    }
    
    // MARK: - METHODS
    
    fileprivate func checkHighScore() {
        
        if HighScoreListConveyor.shared.highScoreList.count < 6 {
            HighScoreListConveyor.shared.highScoreList.append(player)
            highscoreAlert()
        } else {
            if player.score > HighScoreListConveyor.shared.highScoreList[0].score {
                HighScoreListConveyor.shared.highScoreList.removeLast()
                HighScoreListConveyor.shared.highScoreList.insert(player, at: 0)
                highestScoreAlert()
            } else if player.score > HighScoreListConveyor.shared.highScoreList[1].score {
                HighScoreListConveyor.shared.highScoreList.removeLast()
                HighScoreListConveyor.shared.highScoreList.insert(player, at: 1)
                highscoreAlert()
            } else if player.score > HighScoreListConveyor.shared.highScoreList[2].score {
                HighScoreListConveyor.shared.highScoreList.removeLast()
                HighScoreListConveyor.shared.highScoreList.insert(player, at: 2)
                highscoreAlert()
            } else if player.score > HighScoreListConveyor.shared.highScoreList[3].score {
                HighScoreListConveyor.shared.highScoreList.removeLast()
                HighScoreListConveyor.shared.highScoreList.insert(player, at: 3)
                highscoreAlert()
            } else if player.score > HighScoreListConveyor.shared.highScoreList[4].score {
                HighScoreListConveyor.shared.highScoreList.removeLast()
                HighScoreListConveyor.shared.highScoreList.insert(player, at: 4)
                highscoreAlert()
            } else {
                showTemporarilyAlert(title: "TRY AGAIN", message: "You could not make it to be in High Score", duration: 3)
            }
        }
    }
    
    fileprivate func highestScoreAlert() {
        showTemporarilyAlert(title: "CONGRATULATIONS", message: "Your score is the highest ever!", duration: 3)
    }
    
    fileprivate func highscoreAlert() {
        showTemporarilyAlert(title: "CONGRATULATIONS", message: "You can see yourself in High Score List!", duration: 3)
    }
    
    // MARK: - ACTIONS
    
    @IBAction func goToHomePageButtonTouched(_ sender: Any) {
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let homePageViewController = storyboard.instantiateViewController(identifier: "HomePageViewController") as! HomePageViewController
        self.navigationController?.pushViewController(homePageViewController, animated: true)
    }
    
}
