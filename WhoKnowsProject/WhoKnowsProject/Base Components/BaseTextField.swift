//
//  BaseTextField.swift
//  WhoKnowsProject
//
//  Created by Baris Berkin Tasci on 8.01.2021.
//

import Foundation
import UIKit

class BaseTextField: UITextField {
    func prepareTextField() {
        prepareCornerRadius(radius: 5)
        prepareCarterBlueBorders(borderWidth: 1)
    }
}
