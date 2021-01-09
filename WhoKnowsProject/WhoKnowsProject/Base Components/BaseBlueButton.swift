//
//  BaseBlueButton.swift
//  WhoKnowsProject
//
//  Created by Baris Berkin Tasci on 8.01.2021.
//

import Foundation
import UIKit

class BaseBlueButton: UIButton {
    func prepareBlueButton() {
        trappedDarknessBlueButton()
        prepareCornerRadius(radius: 5)
    }
}
