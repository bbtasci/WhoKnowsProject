//
//  UIButtonExtension.swift
//  WhoKnowsProject
//
//  Created by Baris Berkin Tasci on 7.01.2021.
//

import Foundation
import UIKit

extension UIButton {
    
    func isTrappedDarknessBlueButton() {
        // Buttons
        // Red:13 - Green:27 - Blue:42 - TRAPPED DARKNESS BLUE
        self.layer.cornerRadius = 10
        self.layer.masksToBounds = true
        self.backgroundColor = UIColor( red: CGFloat(13/255.0), green: CGFloat(27/255.0), blue: CGFloat(42/255.0), alpha: CGFloat(1.0))
    }
    
    func isNightWhiteButton() {
        // Answer Buttons
        // Red:224 - Green:225 - Blue:221 - NIGHT WHITE BLUE
        self.layer.cornerRadius = 10
        self.layer.masksToBounds = true
        self.backgroundColor = UIColor( red: CGFloat(13/255.0), green: CGFloat(27/255.0), blue: CGFloat(42/255.0), alpha: CGFloat(1.0))
    }
}
