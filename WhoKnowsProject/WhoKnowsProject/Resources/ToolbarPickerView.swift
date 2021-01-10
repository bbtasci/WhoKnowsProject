//
//  ToolbarPickerView.swift
//  WhoKnowsProject
//
//  Created by Baris Berkin Tasci on 10.01.2021.
//

import Foundation
import UIKit

protocol ToolbarPickerViewDelegate: class {
    func didTapDoneForCategory()
    func didTapCancelForCategory()
    func didTapDoneForDifficulty()
    func didTapCancelForDifficulty()
}

class ToolbarPickerView: UIPickerView {

    public private(set) var toolbarForCategory: UIToolbar?
    public weak var toolbarForCategoryDelegate: ToolbarPickerViewDelegate?
    
    public private(set) var toolbarForDifficulty: UIToolbar?
    public weak var toolbarForDifficultyDelegate: ToolbarPickerViewDelegate?

    override init(frame: CGRect) {
        super.init(frame: frame)
        self.commonInit()
    }

    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        self.commonInit()
    }

    private func commonInit() {
        
        // MARK: - TOOLBAR FOR CATEGORY
        
        let toolBar = UIToolbar()
        toolBar.barStyle = UIBarStyle.default
        toolBar.isTranslucent = true
        toolBar.tintColor = .black
        toolBar.sizeToFit()
        
        let doneButtonForCategory = UIBarButtonItem(title: "Done", style: .plain, target: self, action: #selector(self.doneTappedForCategory))
        let spaceButtonForCategory = UIBarButtonItem(barButtonSystemItem: .flexibleSpace, target: nil, action: nil)
        let cancelButtonForCategory = UIBarButtonItem(title: "Cancel", style: .plain, target: self, action: #selector(self.cancelTappedForCategory))
        
        toolBar.setItems([cancelButtonForCategory, spaceButtonForCategory, doneButtonForCategory], animated: false)
        toolBar.isUserInteractionEnabled = true
        
        self.toolbarForCategory = toolBar
        
       // MARK: - TOOLBAR FOR DIFFICULTY
        
        let toolbarForDifficulty = UIToolbar()
        toolbarForDifficulty.barStyle = UIBarStyle.default
        toolbarForDifficulty.isTranslucent = true
        toolbarForDifficulty.tintColor = .black
        toolbarForDifficulty.sizeToFit()
        
        let doneButtonForDifficulty = UIBarButtonItem(title: "Done", style: .plain, target: self, action: #selector(self.doneTappedForDifficulty))
        let spaceButtonForDifficulty = UIBarButtonItem(barButtonSystemItem: .flexibleSpace, target: nil, action: nil)
        let cancelButtonForDifficulty = UIBarButtonItem(title: "Cancel", style: .plain, target: self, action: #selector(self.cancelTappedForDifficulty))
        
        toolbarForDifficulty.setItems([cancelButtonForDifficulty, spaceButtonForDifficulty, doneButtonForDifficulty], animated: false)
        toolbarForDifficulty.isUserInteractionEnabled = true
        
        self.toolbarForDifficulty = toolbarForDifficulty
    }

    @objc func doneTappedForCategory() {
        self.toolbarForCategoryDelegate?.didTapDoneForCategory()
    }
    
    @objc func doneTappedForDifficulty() {
        
        self.toolbarForDifficultyDelegate?.didTapDoneForDifficulty()
    }

    @objc func cancelTappedForCategory() {
        self.toolbarForCategoryDelegate?.didTapCancelForCategory()
    }
    
    @objc func cancelTappedForDifficulty() {
        self.toolbarForDifficultyDelegate?.didTapCancelForDifficulty()
    }
}
