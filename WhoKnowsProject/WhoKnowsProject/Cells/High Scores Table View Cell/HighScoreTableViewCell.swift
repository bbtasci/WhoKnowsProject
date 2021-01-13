//
//  HighScoreTableViewCell.swift
//  WhoKnowsProject
//
//  Created by Baris Berkin Tasci on 10.01.2021.
//

import UIKit

class HighScoreTableViewCell: UITableViewCell {

    // MARK: - OUTLETS
    
    @IBOutlet weak var cellNameLabel: UILabel!
    @IBOutlet weak var cellScoreLabel: UILabel!
    @IBOutlet weak var cellDateLabel: UILabel!
    
    // MARK: - PROPERTIES
    
    // MARK: - LIFE CYCLE METHODS
    override func awakeFromNib() {
        super.awakeFromNib()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
    
    // MARK: - METHODS
    
    func setCell(player: PlayerModel) {
        cellNameLabel.text = player.name
        cellScoreLabel.text = "\(player.score)"
        cellDateLabel.text = player.dateOfPlay
   }
    
}
