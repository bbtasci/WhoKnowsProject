//
//  UILabelExtension.swift
//  WhoKnowsProject
//
//  Created by Baris Berkin Tasci on 7.01.2021.
//

import Foundation
import UIKit

extension UILabel {
    
    func setLabelText(text: String) {
        self.text = text
    }
/*
    func isCarterBlueLabel(text: String) {
        // Labels of Titles in Screens
        // Red: 65 - Green: 90 - Blue: 119 - CARTER'S SCROLL BLUE
        self.layer.cornerRadius = 5
        self.layer.masksToBounds = true
        self.backgroundColor = UIColor( red: CGFloat(65/255.0), green: CGFloat(90/255.0), blue: CGFloat(119.0/255.0), alpha: CGFloat(1.0))
        self.text = text
    }
    
    func isMidnightBlueLabel(text: String) {
        // Labels of Question Pharagraphs / True Answers / False Answers / Total Points
        // Red: 27 - Green: 58 - Blue: 39 - MIDNIGHT EXPRESS BLUE
        self.layer.cornerRadius = 5
        self.layer.masksToBounds = true
        self.backgroundColor = UIColor( red: CGFloat(27/255.0), green: CGFloat(58/255.0), blue: CGFloat(39/255.0), alpha: CGFloat(1.0))
        self.text = text
    }
*/    
}
