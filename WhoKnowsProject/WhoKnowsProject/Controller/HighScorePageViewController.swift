//
//  HighscorePageViewController.swift
//  WhoKnowsProject
//
//  Created by Baris Berkin Tasci on 7.01.2021.
//

import UIKit

class HighScorePageViewController: BaseFadedBlueViewController {
    
    // MARK: - OUTLETS
    
    @IBOutlet weak var iconImageView: UIImageView!
    @IBOutlet weak var nameLabel: BaseLightBlueLabel!
    @IBOutlet weak var dateLabel: BaseLightBlueLabel!
    @IBOutlet weak var scoreLabel: BaseLightBlueLabel!
    @IBOutlet weak var highScoresTableView: UITableView!
    
    // MARK: - PROPERTIES
    
    
    
    // MARK: - LIFE CYCLE METHODS
    
    override func viewDidLoad() {
        super.viewDidLoad()
        //setViewControllerBackgroundColor()
        prepareUI()
        // Do any additional setup after loading the view.
    }
    
    // MARK: - PREPARE UI

    func prepareUI() {
        prepareLayers()
        prepareNavigationItems(title: "HIGH SCORES", backButtonTitle: "Home")
    }
    
    func prepareLayers() {
        iconImageView.image = UIImage(named: "whoknows-award")
        
        nameLabel.prepareLabel()
        nameLabel.setLabelText(text: "Name")
        
        scoreLabel.prepareLabel()
        scoreLabel.setLabelText(text: "Score")
        
        dateLabel.prepareLabel()
        dateLabel.setLabelText(text: "Date")
        
        highScoresTableView.prepareCornerRadius(radius: 5)
        highScoresTableView.backgroundColor = UIColor( red: CGFloat(119/255.0), green: CGFloat(141/255.0), blue: CGFloat(169/255.0), alpha: CGFloat(1.0))
    }
}
