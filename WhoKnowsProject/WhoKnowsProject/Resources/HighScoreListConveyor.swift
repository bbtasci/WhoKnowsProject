//
//  HighScoreListConveyor.swift
//  WhoKnowsProject
//
//  Created by Baris Berkin Tasci on 13.01.2021.
//

import Foundation

class HighScoreListConveyor {
    static let shared = HighScoreListConveyor()
    var highScoreList: [PlayerModel] = []
    
    init() {
        let player1 = PlayerModel()
        player1.name = "Baris"
        player1.score = 10
        player1.dateOfPlay = "10/2/2021"
        
        let player2 = PlayerModel()
        player2.name = "Berkin"
        player2.score = 15
        player2.dateOfPlay = "11/3/2021"
        
        let player3 = PlayerModel()
        player3.name = "Ahmet"
        player3.score = 20
        player3.dateOfPlay = "12/4/2021"
        
        let player4 = PlayerModel()
        player4.name = "Bekir"
        player4.score = 25
        player4.dateOfPlay = "13/5/2021"
        
        let player5 = PlayerModel()
        player5.name = "Kaan"
        player5.score = 30
        player5.dateOfPlay = "14/6/2021"
        
        highScoreList.append(player1)
        highScoreList.append(player2)
        highScoreList.append(player3)
        highScoreList.append(player4)
        highScoreList.append(player5)
    }
    
}
