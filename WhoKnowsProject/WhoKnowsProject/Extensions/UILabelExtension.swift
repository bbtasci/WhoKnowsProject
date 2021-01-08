//
//  UILabelExtension.swift
//  WhoKnowsProject
//
//  Created by Baris Berkin Tasci on 7.01.2021.
//

import Foundation
import UIKit

extension UILabel {
    
    func isCarterBlueLabel() {
        // Labels of Titles in Screens
        // Red: 65 - Green: 90 - Blue: 119 - CARTER'S SCROLL BLUE
        self.layer.cornerRadius = 10
        self.layer.masksToBounds = true
        self.backgroundColor = UIColor( red: CGFloat(65.0/255.0), green: CGFloat(90.0/255.0), blue: CGFloat(119.0/255.0), alpha: CGFloat(1.0))
    }
    
    func isMidnightBlueLabel() {
        // Labels of Question Pharagraphs / True Answers / False Answers / Total Points
        // Red: 27 - Green: 58 - Blue: 39 - MIDNIGHT EXPRESS BLUE
        self.layer.cornerRadius = 10
        self.layer.masksToBounds = true
        self.backgroundColor = UIColor( red: CGFloat(27.0/255.0), green: CGFloat(58.0/255.0), blue: CGFloat(39.0/255.0), alpha: CGFloat(1.0))
    }
}
