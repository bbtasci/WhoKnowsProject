//
//  BaseUIViewExtension.swift
//  WhoKnowsProject
//
//  Created by Baris Berkin Tasci on 7.01.2021.
//

import Foundation
import UIKit

extension UIView {
    func prepareCornerRadius(radius: CGFloat) {
        self.layer.cornerRadius = radius
        self.layer.masksToBounds = true
    }
    
    func prepareCarterBlueBorders(borderWidth: CGFloat) {
        // CARTER BLUE BORDER
        self.layer.borderWidth = borderWidth
        self.layer.borderColor = UIColor(red: CGFloat(65/255.0), green: CGFloat(90/255.0), blue: CGFloat(119.0/255.0), alpha: CGFloat(1.0)).cgColor
    }
    
    // MARK: - BUTTON
    
    func trappedDarknessBlueButton() {
        // Buttons
        // Red:13 - Green:27 - Blue:42 - TRAPPED DARKNESS BLUE
        self.backgroundColor = UIColor(red: CGFloat(13/255.0), green: CGFloat(27/255.0), blue: CGFloat(42/255.0), alpha: CGFloat(1.0))
    }
    
    func nightWhiteButton() {
        // Answer Buttons
        // Red:224 - Green:225 - Blue:221 - NIGHT WHITE BLUE
        self.backgroundColor = UIColor(red: CGFloat(13/255.0), green: CGFloat(27/255.0), blue: CGFloat(42/255.0), alpha: CGFloat(1.0))
    }
    
    // MARK: - LABEL
    
    func carterBlueLabel() {
        // Labels of Titles in Screens
        // Red: 65 - Green: 90 - Blue: 119 - CARTER'S SCROLL BLUE
        self.backgroundColor = UIColor(red: CGFloat(65/255.0), green: CGFloat(90/255.0), blue: CGFloat(119.0/255.0), alpha: CGFloat(1.0))
    }
    
    func midnightBlueLabel() {
        // Labels of Question Pharagraphs / True Answers / False Answers / Total Points
        // Red: 27 - Green: 58 - Blue: 39 - MIDNIGHT EXPRESS BLUE
        self.backgroundColor = UIColor(red: CGFloat(27/255.0), green: CGFloat(58/255.0), blue: CGFloat(39/255.0), alpha: CGFloat(1.0))
    }
    
}
