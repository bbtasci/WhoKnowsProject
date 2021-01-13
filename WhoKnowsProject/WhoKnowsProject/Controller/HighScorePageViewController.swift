//
//  HighscorePageViewController.swift
//  WhoKnowsProject
//
//  Created by Baris Berkin Tasci on 7.01.2021.
//

import UIKit

final class HighScorePageViewController: BaseFadedBlueViewController {
    
    
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
        prepareUI()
    }
    
    // MARK: - PREPARE UI

    fileprivate func prepareUI() {
        prepareLayers()
        prepareNavigationItems(title: "HIGH SCORES", backButtonTitle: "Home")
        prepareTableView()
    }
    
    fileprivate func prepareLayers() {
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
    
    fileprivate func prepareTableView() {
        highScoresTableView.delegate = self
        highScoresTableView.dataSource = self
        highScoresTableView.separatorStyle = .none
        highScoresTableView.prepareCornerRadius(radius: 5)
        highScoresTableView.register(UINib(nibName: "HighScoreTableViewCell", bundle: nil), forCellReuseIdentifier: "HighScoreTableViewCell")
        highScoresTableView.reloadData()
    }
    
}

    // MARK: - UITABLEVIEW DELEGATE AND DATASOURCE METHODS

extension HighScorePageViewController: UITableViewDelegate, UITableViewDataSource {
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return HighScoreListConveyor.shared.highScoreList.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "HighScoreTableViewCell") as? HighScoreTableViewCell
        cell?.setCell(player: HighScoreListConveyor.shared.highScoreList[indexPath.row])
        return cell!
    }

    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return UITableView.automaticDimension
    }
}


