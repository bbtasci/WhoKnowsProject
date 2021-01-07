//
//  NewScoreViewController.swift
//  WhoKnowsProject
//
//  Created by Baris Berkin Tasci on 7.01.2021.
//

import UIKit

class NewScoreViewController: UIViewController {

    // MARK: - OUTLETS
    
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var trueTitleLabel: UILabel!
    @IBOutlet weak var trueNumberLabel: UILabel!
    @IBOutlet weak var falseTitleLabel: UILabel!
    @IBOutlet weak var falseNumberLabel: UILabel!
    @IBOutlet weak var totalPointsTitleLabel: UILabel!
    @IBOutlet weak var totalPointsLabel: UILabel!
    @IBOutlet weak var goToHomePageButton: UIButton!
    
    
    
    // MARK: - PROPERTIES
    
    
    
    // MARK: - LIFE CYCLE METHODS
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    // MARK: - ACTIONS
    
    @IBAction func goToHomePageButtonTouched(_ sender: Any) {
    }
    
}
