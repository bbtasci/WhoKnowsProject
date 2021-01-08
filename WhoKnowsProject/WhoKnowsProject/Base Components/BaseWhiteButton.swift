//
//  BaseWhiteButton.swift
//  WhoKnowsProject
//
//  Created by Baris Berkin Tasci on 8.01.2021.
//

import Foundation
import UIKit

class BaseWhiteButton: UIButton {
    func prepareButton() {
        nightWhiteButton()
        prepareCornerRadius(radius: 10)
    }
}
