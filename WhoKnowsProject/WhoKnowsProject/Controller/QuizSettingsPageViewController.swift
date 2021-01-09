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
    @IBOutlet weak var categoryPickerView: UIPickerView!
    
    @IBOutlet weak var difficultyLabel: BaseLightBlueLabel!
    @IBOutlet weak var difficultyTextField: BaseTextField!
    
    @IBOutlet weak var startButton: BaseBlueButton!
    
    // MARK: - PROPERTIES
    
    var categories = CategoryModel()
    var selectedCategory: Int?
    var selectedCategoryName: String?
    let difficultyLevels = ["easy", "medium", "hard"]
    var difficultyPickerView = UIPickerView()
    
    // MARK: - LIFE CYCLE METHODS
    
    override func viewDidLoad() {
        super.viewDidLoad()
        //setViewControllerBackgroundColor()
        // Do any additional setup after loading the view.
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
        
        difficultyLabel.prepareLabel()
        difficultyLabel.setLabelText(text: "Difficulty")
        
        difficultyTextField.prepareTextField()
        difficultyTextField.placeholder = "Choose Difficulty"
        
        startButton.prepareBlueButton()
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
    
    // MARK: - ALERT
    
    func showTemporarilyAlert(title: String, message: String) {
        let showTemporarilyAlert = UIAlertController(title: title, message: message, preferredStyle: .alert)
        self.present(showTemporarilyAlert, animated: true, completion: nil)
        let when = DispatchTime.now() + 3
        DispatchQueue.main.asyncAfter(deadline: when){
            showTemporarilyAlert.dismiss(animated: true, completion: nil)
        }
    }
    
    
    // MARK: - ACTIONS
    
    @IBAction func startButtonTouched(_ sender: Any) {
        if nameTextField.text == "" || categoryLabel.text == "" || difficultyLabel.text == "" {
            showTemporarilyAlert(title: "WARNING", message: "Please do not leave empty NAME, CATEGORY and DIFFICULTY areas!")
        } else {
            let storyboard = UIStoryboard(name: "Main", bundle: nil)
            let quizPageViewController = storyboard.instantiateViewController(identifier: "QuizPageViewController") as! QuizPageViewController
            quizPageViewController.pickedCategory = selectedCategory ?? 0
            quizPageViewController.pickedCategoryName = selectedCategoryName ?? ""
            quizPageViewController.pickedDifficulty = difficultyTextField.text?.lowercased() ?? ""
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
            return categories.trivia_categories.count
        } else {
            return difficultyLevels.count
        }
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        if pickerView.tag == 1 {
            return categories.trivia_categories[row].name
        } else {
            return difficultyLevels[row].capitalized
        }
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        if pickerView.tag == 1 {
            selectedCategory = categories.trivia_categories[row].id
            selectedCategoryName = categories.trivia_categories[row].name
        } else {
            difficultyTextField.text = difficultyLevels[row].capitalized
        }
    }
}
