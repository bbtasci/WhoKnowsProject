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
        // View Controller Background Color
        // Red: 119 - Green: 141 - Blue: 169 - EVENING HUSH BLUE
        self.view.backgroundColor = UIColor( red: CGFloat(119/255.0), green: CGFloat(141/255.0), blue: CGFloat(169/255.0), alpha: CGFloat(1.0))
    }
    func blueNavigationBar() {
        self.navigationController?.navigationBar.barTintColor = UIColor(red: CGFloat(13/255.0), green: CGFloat(27/255.0), blue: CGFloat(42/255.0), alpha: CGFloat(1.0))
    }
    
    func showTemporarilyAlert(title: String, message: String, duration: Int) {
        let durationOfAlert = DispatchTime.now() + .seconds(duration)
        let showTemporarilyAlert = UIAlertController(title: title, message: message, preferredStyle: .alert)
        self.present(showTemporarilyAlert, animated: true, completion: nil)
        let when = durationOfAlert
        DispatchQueue.main.asyncAfter(deadline: when){
            showTemporarilyAlert.dismiss(animated: true, completion: nil)
        }
    }
    
}
