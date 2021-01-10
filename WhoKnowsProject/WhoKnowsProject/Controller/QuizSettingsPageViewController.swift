//
//  GamePageViewController.swift
//  WhoKnowsProject
//
//  Created by Baris Berkin Tasci on 7.01.2021.
//

import UIKit
import Alamofire

class QuizSettingsPageViewController: BaseFadedBlueViewController {
    
    // MARK: - OUTLETS
    
    @IBOutlet weak var newGameInfoLabel: BaseLightBlueLabel!
    @IBOutlet weak var nameLabel: BaseLightBlueLabel!
    @IBOutlet weak var nameTextField: BaseTextField!
    @IBOutlet weak var categoryLabel: BaseLightBlueLabel!
    @IBOutlet weak var categoryTextField: BaseTextField!
    @IBOutlet weak var difficultyLabel: BaseLightBlueLabel!
    @IBOutlet weak var difficultyTextField: BaseTextField!
    @IBOutlet weak var startButton: BaseBlueButton!
    
    // MARK: - PROPERTIES
    
    var categories = CategoryModel()
    var selectedCategoryId: Int?
    var selectedCategoryName: String?
    let difficultyLevels = ["easy", "medium", "hard"]
    var difficultyPickerView = ToolbarPickerView()
    var categoryList: [String] = [] // Print on Category TextField
    var categoryIdList: [Int] = [] // Pass ID to QuizPageViewController to fetch data from API
    var categoryPickerView = ToolbarPickerView()
    
    // MARK: - LIFE CYCLE METHODS
    
    override func viewDidLoad() {
        super.viewDidLoad()
        prepareUI()
    }
    
    // MARK: - PREPARE UI
    
    func prepareUI() {
        prepareLayers()
        prepareCategoryPickerView()
        prepareDifficultyPickerView()
        prepareNavigationItems(title: "QUIZ SETTINGS", backButtonTitle: "Quiz Settings")
    }
    
    func prepareLayers() {
        newGameInfoLabel.prepareLabel()
        newGameInfoLabel.setLabelText(text: "You are about to start. \n Pick the best options for you.")
        
        nameLabel.prepareLabel()
        nameLabel.setLabelText(text: "Name")
        
        nameTextField.prepareTextField()
        nameTextField.placeholder = "Enter Your Name"
        
        categoryLabel.prepareLabel()
        categoryLabel.setLabelText(text: "Category")
        
        categoryTextField.prepareTextField()
        categoryTextField.placeholder = "Pick Category"
        
        difficultyLabel.prepareLabel()
        difficultyLabel.setLabelText(text: "Difficulty")
        
        difficultyTextField.prepareTextField()
        difficultyTextField.placeholder = "Choose Difficulty"
        
        startButton.prepareBlueButton()
        startButton.setButtonTitle(title: "START")
    }
    
    func prepareCategoryPickerView() {
        getCategoryFromAPI() // Update categories list by API
        categoryPickerView.tag = 1
        categoryTextField.inputView = categoryPickerView
        categoryTextField.inputAccessoryView = categoryPickerView.toolbarForCategory
        categoryPickerView.delegate = self
        categoryPickerView.dataSource = self
        categoryPickerView.toolbarForCategoryDelegate = self
    }
    
    func prepareDifficultyPickerView() {
        difficultyPickerView.tag = 2
        difficultyTextField.inputView = difficultyPickerView
        difficultyTextField.inputAccessoryView = difficultyPickerView.toolbarForDifficulty
        difficultyPickerView.delegate = self
        difficultyPickerView.dataSource = self
        difficultyPickerView.toolbarForDifficultyDelegate = self

    }
    
    // MARK: - SERVICE CALL
    
    func getCategoryFromAPI() {
        AF.request("https://opentdb.com/api_category.php").responseJSON { response in
            if let categoryData = response.data {
                let triviaCategoriesList = try! JSONDecoder().decode(CategoryModel.self, from: categoryData)
                self.categories.trivia_categories = triviaCategoriesList.trivia_categories
                
                for i in 0...23 { // Append categories into the list from API
                    self.categoryList.append(triviaCategoriesList.trivia_categories[i].name ?? "")
                    self.categoryIdList.append(triviaCategoriesList.trivia_categories[i].id ?? 0)
                }
                self.categoryPickerView.reloadAllComponents()
            }
        }
    }
    
    // MARK: - ACTIONS
    
    @IBAction func startButtonTouched(_ sender: Any) {
        if nameTextField.text == "" || categoryLabel.text == "" || difficultyLabel.text == "" {
            self.showTemporarilyAlert(title: "WARNING", message: "Please enter your NAME, pick one CATEGORY and choose DIFFICULTY!", duration: 2)
        } else {
            let storyboard = UIStoryboard(name: "Main", bundle: nil)
            let quizPageViewController = storyboard.instantiateViewController(identifier: "QuizPageViewController") as! QuizPageViewController
            quizPageViewController.pickedCategoryId = selectedCategoryId ?? 0
            quizPageViewController.pickedCategoryName = categoryTextField.text ?? ""
            quizPageViewController.pickedDifficulty = difficultyTextField.text?.lowercased() ?? ""
            quizPageViewController.playerName = nameTextField.text ?? ""
            self.navigationController?.pushViewController(quizPageViewController, animated: true)
        }
    }
}

    // MARK: - UIPICKERVIEW DELEGATE AND DATASOURCE METHODS

extension QuizSettingsPageViewController: UIPickerViewDelegate, UIPickerViewDataSource {
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        if pickerView.tag == 1 {
            return categoryList.count
        } else {
            return difficultyLevels.count
        }
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        if pickerView.tag == 1 {
            return categoryList[row]
        } else {
            return difficultyLevels[row].capitalized
        }
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        if pickerView.tag == 1 {
            categoryTextField.text = categoryList[row]
            selectedCategoryId = categoryIdList[row]
        } else {
            difficultyTextField.text = difficultyLevels[row].capitalized
        }
    }
}

    // MARK: - TOOLBAR PICKER VIEW DELEGATE (In order to add Cancel and Done Buttons to PickerView)

extension QuizSettingsPageViewController: ToolbarPickerViewDelegate {

    func didTapDoneForCategory() {
        let categoryRow = self.categoryPickerView.selectedRow(inComponent: 0)
        self.categoryPickerView.selectRow(categoryRow, inComponent: 0, animated: false)
        self.categoryTextField.text = self.categoryList[categoryRow].capitalized
        self.categoryTextField.resignFirstResponder()
    }
    
    func didTapCancelForCategory() {
        self.categoryTextField.text = nil
        self.categoryTextField.resignFirstResponder()
        
    }
    
    func didTapDoneForDifficulty() {
        let difficultyRow = self.difficultyPickerView.selectedRow(inComponent: 0)
        self.difficultyPickerView.selectRow(difficultyRow, inComponent: 0, animated: false)
        self.difficultyTextField.text = self.difficultyLevels[difficultyRow].capitalized
        self.difficultyTextField.resignFirstResponder()
    }

    func didTapCancelForDifficulty() {
        self.difficultyTextField.text = nil
        self.difficultyTextField.resignFirstResponder()
    }
}
