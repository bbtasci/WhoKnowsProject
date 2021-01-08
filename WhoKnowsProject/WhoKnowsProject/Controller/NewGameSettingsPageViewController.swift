//
//  GamePageViewController.swift
//  WhoKnowsProject
//
//  Created by Baris Berkin Tasci on 7.01.2021.
//

import UIKit
import Alamofire

class NewGameSettingsPageViewController: BaseFadedBlueViewController {
    
    // MARK: - OUTLETS
    
    @IBOutlet weak var newGameInfoLabel: BaseLightBlueLabel!
    
    @IBOutlet weak var nameLabel: BaseLightBlueLabel!
    @IBOutlet weak var nameTextField: UITextField!
    
    @IBOutlet weak var categoryLabel: BaseLightBlueLabel!
    @IBOutlet weak var categoryPickerView: UIPickerView!
    
    @IBOutlet weak var difficultyLabel: BaseLightBlueLabel!
    @IBOutlet weak var difficultyTextField: UITextField!
    
    @IBOutlet weak var startButton: BaseBlueButton!
    
    // MARK: - PROPERTIES
    
    var categories = CategoryModel()
    var selectedCategory: Int?
    let difficultyLevels = ["Easy", "Medium", "Hard"]
    var difficultyPickerView = UIPickerView()
    
    // MARK: - LIFE CYCLE METHODS
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        prepareUI()
    }
    

    
    // MARK: - PREPARE UI
    func prepareUI() {
        prepareLayers()
        prepareCategoryPickerView()
        prepareDifficultyPickerView()
    }
    
    func prepareLayers() {
        newGameInfoLabel.prepareLabel()
        newGameInfoLabel.setLabelText(text: "Enter your name and \n choose best options for you.")
        
        nameLabel.prepareLabel()
        nameLabel.setLabelText(text: "Name")
        
        categoryLabel.prepareLabel()
        categoryLabel.setLabelText(text: "Category")
        
        difficultyLabel.prepareLabel()
        difficultyLabel.setLabelText(text: "Difficulty")
        
        startButton.prepareButton()
        startButton.setButtonTitle(title: "START")
    }
    
    func prepareCategoryPickerView() {
        categoryPickerView.tag = 1
        categoryPickerView.delegate = self
        categoryPickerView.dataSource = self
        getCategoryFromAPI()
        
    }
    func prepareDifficultyPickerView() {
        difficultyPickerView.tag = 2
        difficultyPickerView.delegate = self
        difficultyPickerView.dataSource = self
        difficultyTextField.inputView = difficultyPickerView
    }
    
    // MARK: - SERVICE CALL
    
    func getCategoryFromAPI() {
        AF.request("https://opentdb.com/api_category.php").responseJSON { response in
            if let categoryData = response.data {
                let triviaCategoriesList = try! JSONDecoder().decode(CategoryModel.self, from: categoryData)
                self.categories.trivia_categories = triviaCategoriesList.trivia_categories
                self.categoryPickerView.reloadAllComponents()
                
            }
        }
    }
    // MARK: - ACTIONS
    
    @IBAction func startButtonTouched(_ sender: Any) {
    }
    
}

extension NewGameSettingsPageViewController: UIPickerViewDelegate, UIPickerViewDataSource {
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        if pickerView.tag == 1 {
            return categories.trivia_categories.count
        } else {
            return difficultyLevels.count
        }
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        if pickerView.tag == 1 {
            return categories.trivia_categories[row].name
        } else {
            return difficultyLevels[row]
        }
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        if pickerView.tag == 1 {
            selectedCategory = categories.trivia_categories[row].id
        } else {
            difficultyTextField.text = difficultyLevels[row]
        }
    }
}
