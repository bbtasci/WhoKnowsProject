//
//  UIViewControllerExtension.swift
//  WhoKnowsProject
//
//  Created by Baris Berkin Tasci on 7.01.2021.
//

import Foundation
import UIKit

extension UIViewController {
    func eveningHushBlueBackground() {
        // View Controller Background Colors
        // Red: 119 - Green: 141 - Blue: 169 - EVENING HUSH BLUE
        self.view.backgroundColor = UIColor( red: CGFloat(119/255.0), green: CGFloat(141/255.0), blue: CGFloat(169/255.0), alpha: CGFloat(1.0))
    }
}
