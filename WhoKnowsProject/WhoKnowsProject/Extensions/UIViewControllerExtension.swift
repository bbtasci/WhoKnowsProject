//
//  UIViewControllerExtension.swift
//  WhoKnowsProject
//
//  Created by Baris Berkin Tasci on 7.01.2021.
//

import Foundation
import UIKit

extension UIViewController {
    func setViewControllerBackground (redCGFloat: CGFloat, greenCGFloat: CGFloat, blueCGFloat: CGFloat, alphaCGFloat: CGFloat) {
        self.view.backgroundColor = UIColor(red: redCGFloat, green: greenCGFloat, blue: blueCGFloat, alpha: alphaCGFloat)
    }
}
