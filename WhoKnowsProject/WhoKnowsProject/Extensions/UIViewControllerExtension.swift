//
//  UIViewControllerExtension.swift
//  WhoKnowsProject
//
//  Created by Baris Berkin Tasci on 7.01.2021.
//

import Foundation
import UIKit
import AVFoundation

extension UIViewController {
    
  // MARK: - NAVIGATION BAR COLOR
    
    func blueNavigationBar() {
        self.navigationController?.navigationBar.barTintColor = UIColor(red: CGFloat(13/255.0), green: CGFloat(27/255.0), blue: CGFloat(42/255.0), alpha: CGFloat(1.0))
    }
    
    // MARK: - ALERTS
    
    func showTemporarilyAlert(title: String, message: String, duration: Int) {
        let durationOfAlert = DispatchTime.now() + .seconds(duration)
        let showTemporarilyAlert = UIAlertController(title: title, message: message, preferredStyle: .alert)
        self.present(showTemporarilyAlert, animated: true, completion: nil)
        let when = durationOfAlert
        DispatchQueue.main.asyncAfter(deadline: when){
            showTemporarilyAlert.dismiss(animated: true, completion: nil)
        }
    }
    
    func showInteractiveAlert(title: String, message: String) {
        let interactiveAlert = UIAlertController(title: title, message: message, preferredStyle: .actionSheet)
        interactiveAlert.addAction(UIAlertAction(title: "OK", style: .default, handler: nil))
        self.present(interactiveAlert, animated: true)
    }
}
