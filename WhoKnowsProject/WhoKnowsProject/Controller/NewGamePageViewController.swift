//
//  NewGamePageViewController.swift
//  WhoKnowsProject
//
//  Created by Baris Berkin Tasci on 7.01.2021.
//

import UIKit

class NewGamePageViewController: UIViewController {

    // MARK: - OUTLETS
    
    @IBOutlet weak var categoryLabel: BaseLightBlueLabel!
    @IBOutlet weak var questionNumberLabel: UILabel!
    @IBOutlet weak var questionLabel: BaseDarkBlueLabel!
    
    @IBOutlet weak var firstAnswerButton: BaseWhiteButton!
    @IBOutlet weak var secondAnswerButton: BaseWhiteButton!
    @IBOutlet weak var thirdAnswerButton: BaseWhiteButton!
    @IBOutlet weak var fourthAnswerButton: BaseWhiteButton!
    
    @IBOutlet weak var totalPointsTitleLabel: UILabel!
    @IBOutlet weak var totalPointsLabel: UILabel!
    @IBOutlet weak var timerTitleLabel: UILabel!
    @IBOutlet weak var timerImageView: UIImageView!
    @IBOutlet weak var timerLabel: UILabel!
    
    
    // MARK: - LIFE CYCLE METHODS
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    // MARK: - ACTIONS

    @IBAction func firstAnswerButtonTouched(_ sender: Any) {
    }
    
    @IBAction func secondAnswerButtonTouched(_ sender: Any) {
    }
    
    @IBAction func thirdAnswerButtonTouched(_ sender: Any) {
    }
    
    @IBAction func fourthAnswerButtonTouched(_ sender: Any) {
    }
    
}
