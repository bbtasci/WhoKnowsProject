//
//  HighscorePageViewController.swift
//  WhoKnowsProject
//
//  Created by Baris Berkin Tasci on 7.01.2021.
//

import UIKit

class HighScorePageViewController: UIViewController {
    
    // MARK: - OUTLETS
    
    @IBOutlet weak var titleLabel: BaseLightBlueLabel!
    @IBOutlet weak var iconImageView: UIImageView!
    @IBOutlet weak var highScoresTableView: UITableView!
    
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
        titleLabel.setLabelText(text: "HIGH SCORES")
        iconImageView.image = UIImage(named: "whoknows-iconwk")
    }
}
