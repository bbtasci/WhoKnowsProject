//
//  NewScoreViewController.swift
//  WhoKnowsProject
//
//  Created by Baris Berkin Tasci on 7.01.2021.
//

import UIKit

class NewScoreViewController: UIViewController {

    // MARK: - OUTLETS
    
    @IBOutlet weak var titleLabel: BaseLightBlueLabel!
    @IBOutlet weak var trueTitleLabel: BaseDarkBlueLabel!
    @IBOutlet weak var trueNumberLabel: BaseDarkBlueLabel!
    @IBOutlet weak var falseTitleLabel: BaseDarkBlueLabel!
    @IBOutlet weak var falseNumberLabel: BaseDarkBlueLabel!
    @IBOutlet weak var totalPointsTitleLabel: BaseDarkBlueLabel!
    @IBOutlet weak var totalPointsLabel: BaseDarkBlueLabel!
    @IBOutlet weak var goToHomePageButton: BaseBlueButton!
    
    // MARK: - PROPERTIES
    
    
    
    // MARK: - LIFE CYCLE METHODS
    
    override func viewDidLoad() {
        super.viewDidLoad()
        prepareUI()

        // Do any additional setup after loading the view.
    }
    
    // MARK: - PREPARE UI
    
    func prepareUI() {
        prepareLayers()
    }
    
    func prepareLayers() {
        titleLabel.prepareLabel()
        titleLabel.setLabelText(text: "END OF THE QUIZ")
        
        trueTitleLabel.prepareLabel()
        trueTitleLabel.setLabelText(text: "True Answers")
        
        trueNumberLabel.prepareLabel()
        
        falseTitleLabel.prepareLabel()
        falseTitleLabel.setLabelText(text: "False Answers")
        falseNumberLabel.prepareLabel()
        
        totalPointsLabel.prepareLabel()
        totalPointsLabel.setLabelText(text: "Total Points")
        
        goToHomePageButton.prepareButton()
        goToHomePageButton.setButtonTitle(title: "Go To Home Page")
    }
    
    // MARK: - ACTIONS
    
    @IBAction func goToHomePageButtonTouched(_ sender: Any) {
    }
    
}
