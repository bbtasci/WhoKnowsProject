//
//  NewGamePageViewController.swift
//  WhoKnowsProject
//
//  Created by Baris Berkin Tasci on 7.01.2021.
//

import UIKit
import Alamofire
import AVFoundation

class QuizPageViewController: BaseFadedBlueViewController {

    // MARK: - OUTLETS
    
    @IBOutlet weak var categoryLabel: BaseLightBlueLabel!
    @IBOutlet weak var questionNumberLabel: UILabel!
    @IBOutlet weak var questionLabel: BaseDarkBlueLabel!
    @IBOutlet weak var totalPointsTitleLabel: UILabel!
    @IBOutlet weak var totalPointsLabel: UILabel!
    @IBOutlet weak var timerTitleLabel: UILabel!
    @IBOutlet weak var timerImageView: UIImageView!
    @IBOutlet weak var timerLabel: UILabel!
    
    // MARK: - PROPERTIES
    
    let correctButtonSound = URL(fileURLWithPath: Bundle.main.path(forResource: "correct-sound", ofType: "mp3")!)
    let incorrectButtonSound = URL(fileURLWithPath: Bundle.main.path(forResource: "incorrect-sound", ofType: "wav")!)
    let timeoutSound = URL(fileURLWithPath: Bundle.main.path(forResource: "timeout-sound", ofType: "mp3")!)
    
    var pickedCategoryId: Int = 0
    var pickedCategoryName: String = ""
    var pickedDifficulty: String = ""
    var quizResults = QuestionModel()
    var playerName: String = ""

    var questions = [String]()
    var answers = [[String]]()
    var score = 0
    var currentQuestion: Int = 0
    var rightAnswerPlacement: UInt32 = 0
    
    var timer: Timer?
    var timeLeft = 10
    
    // MARK: - LIFE CYCLE METHODS
    
    override func viewDidLoad() {
        super.viewDidLoad()
        categoryLabel.text = pickedCategoryName
        prepareUI()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        getQuestionsFromAPI()
    }
    
    // MARK: - PREPARE UI
    
    func prepareUI() {
        prepareNavigationItems(title: "WHO KNOWS", backButtonTitle: "Back")
        prepareLayers()
    }
    
    func prepareLayers() {
        categoryLabel.prepareLabel()
        categoryLabel.text = pickedCategoryName.uppercased()
        questionLabel.prepareLabel()
        totalPointsLabel.text = "0"
    }
    
    // MARK: - SERVICE CALL
    
    func getQuestionsFromAPI() {
        AF.request("https://opentdb.com/api.php?amount=50&category=\(pickedCategoryId)&difficulty=\(pickedDifficulty)&type=multiple").responseJSON { response in
            if let questionData = response.data {
                var question = try! JSONDecoder().decode(QuestionModel.self, from: questionData)
                self.quizResults.results = question.results
                
                for i in 0...49 {
                    question.results[i].incorrect_answers.insert(question.results[i].correct_answer, at: 0)
                    self.answers.append(question.results[i].incorrect_answers)
                    self.questions.append(question.results[i].question)
                }
                print("question all answers: \(question.results[0].incorrect_answers)")
                print("correct answer: \(question.results[0].correct_answer)")
                self.newQuestion()
            }
        }
    }
    
    // MARK: - METHODS
    
    func newQuestion() {
        
        DispatchQueue.main.asyncAfter(deadline: .now() + 2.0) {
            self.questionLabel.text = self.questions[self.currentQuestion]
            
            self.rightAnswerPlacement = arc4random_uniform(4) + 1
            
            var button: UIButton = UIButton() // Create a UIButton
            
            var x = 1
            
            for i in 1...4 { // Create all answer buttons
                button = self.view.viewWithTag(i) as! UIButton
                button.prepareCornerRadius(radius: 5)
                button.prepareCarterBlueBorders(borderWidth: 2)
                
                if (i == Int(self.rightAnswerPlacement)) {
                    button.setTitle(self.answers[self.currentQuestion][0], for: .normal)
                    //button.backgroundColor = .green
                    
                    
                } else {
                    button.setTitle(self.answers[self.currentQuestion][x], for: .normal)
                    //button.backgroundColor = .red
                    x += 1
                }
            }
            
            self.currentQuestion += 1
            self.questionNumberLabel.text = "Question #\(self.currentQuestion)"
            
            self.timerLabel.textColor = .black
            self.timerImageView.tintColor = .black
            
            self.timeLeft = 10
            self.startTimer()
        }
    }
    
    
    func startTimer() {
        
        timer = Timer.scheduledTimer(withTimeInterval: 1.0, repeats: true) { timer in
            if self.timeLeft > -1 {
                self.timerLabel.text = String(self.timeLeft)
                self.timeLeft -= 1
            } else {
                
                do {
                    self.audioPlayer = try AVAudioPlayer(contentsOf: self.timeoutSound)
                    self.audioPlayer.play()
                } catch {
                    print("Could not load voice")
                }
                
                self.stopTimer()
                
                self.showTemporarilyAlert(title: "YOU ARE DONE!", message: "You answered \(self.currentQuestion - 1) questions right.", duration: 3)
                
                DispatchQueue.main.asyncAfter(deadline: .now() + 3.0) {
                    let storyboard = UIStoryboard(name: "Main", bundle: nil)
                    let scorePageViewController = storyboard.instantiateViewController(identifier: "ScorePageViewController") as! ScorePageViewController
                    scorePageViewController.totalPoints = self.score
                    scorePageViewController.totalTrueNumbers = self.currentQuestion - 1
                    scorePageViewController.playerName = self.playerName
                    self.navigationController?.pushViewController(scorePageViewController, animated: true)
                }
            }
            
            if self.timeLeft < 5 {
                self.timerImageView.tintColor = .red
                self.timerLabel.textColor = .red
            }
        }
    }
    
    func stopTimer() {
        timer?.invalidate()
    }
    
    // MARK: - ACTIONS

    @IBAction func action(_ sender: Any) {
        if ((sender as AnyObject).tag == Int(rightAnswerPlacement)) {
            stopTimer()
            //print ("right")
            
            do {
                audioPlayer = try AVAudioPlayer(contentsOf: correctButtonSound)
                audioPlayer.play()
            } catch {
                print("Could not load voice")
            }

            if pickedDifficulty == "easy" {
                score += 5
                totalPointsLabel.text = "\(score)"
            } else if pickedDifficulty == "medium" {
                score += 10
                totalPointsLabel.text = "\(score)"
            } else {
                score += 20
                totalPointsLabel.text = "\(score)"
            }
            
        } else {
            stopTimer()
            //print ("wrong")
            
            do {
                audioPlayer = try AVAudioPlayer(contentsOf: incorrectButtonSound)
                audioPlayer.play()
            } catch {
                print("Could not load voice")
            }
            
            showTemporarilyAlert(title: "YOU ARE DONE!", message: "You answered \(self.currentQuestion - 1) questions right.", duration: 3)
            DispatchQueue.main.asyncAfter(deadline: .now() + 3.0) {
                let storyboard = UIStoryboard(name: "Main", bundle: nil)
                let scorePageViewController = storyboard.instantiateViewController(identifier: "ScorePageViewController") as! ScorePageViewController
                scorePageViewController.totalPoints = self.score
                scorePageViewController.totalTrueNumbers = self.currentQuestion - 1
                scorePageViewController.playerName = self.playerName
                self.navigationController?.pushViewController(scorePageViewController, animated: true)
            }
        }
        DispatchQueue.main.asyncAfter(deadline: .now() + 3.0) {
            self.newQuestion()
        }
    }
}
