//
//  NewGamePageViewController.swift
//  WhoKnowsProject
//
//  Created by Baris Berkin Tasci on 7.01.2021.
//

import UIKit
import Alamofire

class QuizPageViewController: BaseFadedBlueViewController {

    // MARK: - OUTLETS
    
    @IBOutlet weak var categoryLabel: BaseLightBlueLabel!
    @IBOutlet weak var questionNumberLabel: UILabel!
    @IBOutlet weak var questionLabel: BaseDarkBlueLabel!
    
    @IBOutlet weak var firstAnswerButton: BaseWhiteButton!
    @IBOutlet weak var secondAnswerButton: BaseWhiteButton!
    @IBOutlet weak var thirdAnswerButton: BaseWhiteButton!
    @IBOutlet weak var fourthAnswerButton: BaseWhiteButton!
    
    @IBOutlet weak var totalPointsTitleLabel: UILabel!
    @IBOutlet weak var totalPointsLabel: UILabel!
    @IBOutlet weak var timerTitleLabel: UILabel!
    @IBOutlet weak var timerImageView: UIImageView!
    @IBOutlet weak var timerLabel: UILabel!
    
    // MARK: - PROPERTIES
    
    var pickedCategory: Int = 0
    var pickedCategoryName: String = ""
    var pickedDifficulty: String = ""
    var quizResults = QuestionModel()
    
    // MARK: - LIFE CYCLE METHODS
    
    override func viewDidLoad() {
        super.viewDidLoad()
        getQuestionsFromAPI()
        prepareUI()
        // Do any additional setup after loading the view.
    }
    
    // MARK: - PREPARE UI
    
    func prepareUI() {
        prepareNavigationItems(title: "WHO KNOWS", backButtonTitle: "Back")
        prepareLayers()
    }
    
    func prepareLayers() {
        categoryLabel.prepareLabel()
        categoryLabel.text = pickedCategoryName.uppercased()
    }
    
    // MARK: - SERVICE CALL
    
    func getQuestionsFromAPI() {
        AF.request("https://opentdb.com/api.php?amount=5&category=\(pickedCategory)&difficulty=\(pickedDifficulty)&type=multiple").responseJSON { response in
            if let questionData = response.data {
                let question = try! JSONDecoder().decode(QuestionModel.self, from: questionData)
                self.quizResults.results = question.results
                print(self.quizResults)
                print(self.quizResults.results.first?.difficulty)
            }
        }
    }
    
    // MARK: - ACTIONS

    @IBAction func firstAnswerButtonTouched(_ sender: Any) {
    }
    
    @IBAction func secondAnswerButtonTouched(_ sender: Any) {
    }
    
    @IBAction func thirdAnswerButtonTouched(_ sender: Any) {
    }
    
    @IBAction func fourthAnswerButtonTouched(_ sender: Any) {
    }
    
}
