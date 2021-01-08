//
//  GamePageViewController.swift
//  WhoKnowsProject
//
//  Created by Baris Berkin Tasci on 7.01.2021.
//

import UIKit
import Alamofire

class NewGameSettingsPageViewController: UIViewController {
    
    // MARK: - OUTLETS
    
    @IBOutlet weak var newGameInfoLabel: UILabel!
    
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var nameTextField: UITextField!
    
    @IBOutlet weak var categoryLabel: UILabel!
    @IBOutlet weak var categoryPickerView: UIPickerView!
    
    @IBOutlet weak var difficultyLabel: UILabel!
    @IBOutlet weak var difficultyTextField: UITextField!
    
    @IBOutlet weak var startGameButton: UIButton!
    
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
        prepareOutletsAndViewBackgroundColor()
        prepareCategoryPickerView()
        prepareDifficultyPickerView()
    }
    
    func prepareOutletsAndViewBackgroundColor() {
        newGameInfoLabel.isCarterBlueLabel()
        nameLabel.isCarterBlueLabel()
        categoryLabel.isCarterBlueLabel()
        difficultyLabel.isCarterBlueLabel()
        startGameButton.isTrappedDarknessBlueButton()
        
        // Screen Background Color
        eveningHushBlueBackground()
        // 119 - 141 - 169
        //self.view.backgroundColor = UIColor(red: 119/255, green: 141/255, blue: 169/255, alpha: 1.0)
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
    
    @IBAction func startGameButtonTouched(_ sender: Any) {
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
