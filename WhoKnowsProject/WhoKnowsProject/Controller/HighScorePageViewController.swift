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
    
    var savedPlayer = Player()
    var highScoreList: [Player] = []
    
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

    // MARK: - UITABLEVIEW DELEGATE AND DATASOURCE METHODS

extension HighScorePageViewController: UITableViewDelegate, UITableViewDataSource {
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return highScoreList.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "HighScoreTableViewCell") as? HighScoreTableViewCell
        cell?.setCell(player: highScoreList[indexPath.row])
        return cell!
    }

    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return UITableView.automaticDimension
    }
    
    // MARK: - Delegation Method
    
}


