//
//  NewGamePageViewController.swift
//  WhoKnowsProject
//
//  Created by Baris Berkin Tasci on 7.01.2021.
//

import UIKit
import Alamofire
import AVFoundation

final class QuizPageViewController: BaseFadedBlueViewController {

    // MARK: - OUTLETS
    
    @IBOutlet weak var button1: BaseWhiteButton!
    @IBOutlet weak var button2: BaseWhiteButton!
    @IBOutlet weak var button3: BaseWhiteButton!
    @IBOutlet weak var button4: BaseWhiteButton!
    
    @IBOutlet weak var categoryLabel: BaseLightBlueLabel!
    @IBOutlet weak var questionNumberLabel: UILabel!
    @IBOutlet weak var questionLabel: BaseDarkBlueLabel!
    @IBOutlet weak var totalPointsTitleLabel: UILabel!
    @IBOutlet weak var totalPointsLabel: UILabel!
    
    @IBOutlet weak var timerTitleLabel: UILabel!
    @IBOutlet weak var timerLabel: UILabel!
    @IBOutlet weak var timerImageView: UIImageView!
    
    // MARK: - PROPERTIES
    
    let correctButtonSound = URL(fileURLWithPath: Bundle.main.path(forResource: "correct-sound", ofType: "mp3")!)
    let incorrectButtonSound = URL(fileURLWithPath: Bundle.main.path(forResource: "incorrect-sound", ofType: "wav")!)
    let timeoutSound = URL(fileURLWithPath: Bundle.main.path(forResource: "timeout-sound", ofType: "mp3")!)
    
    var pickedCategoryId: Int = 0
    var pickedCategoryName: String = ""
    var pickedDifficulty: String = ""
    
    var player = PlayerModel()
    var question = QuestionModel()
    
    var questionCounter: Int = 1
    var timeLeft: Int = 10
    var timer: Timer?
    var randomNumber: Int?
    
    // MARK: - LIFE CYCLE METHODS
    
    override func viewDidLoad() {
        super.viewDidLoad()
        categoryLabel.text = pickedCategoryName
        prepareUI()
        startTimer()
        addActivityIndicator()
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        timer?.invalidate()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(true)
        getQuestionsFromAPI()
    }
    
    // MARK: - SERVICE CALL
    
    fileprivate func getQuestionsFromAPI() {
        activityView.startAnimating()
        blurredBackground()
        
        AF.request("https://opentdb.com/api.php?amount=1&category=\(pickedCategoryId)&difficulty=\(pickedDifficulty)&type=multiple").responseJSON { response in
            if let questionData = response.data {
                let quizQuestions = try! JSONDecoder().decode(QuestionModel.self, from: questionData)
                self.question = quizQuestions
                self.questionLabel.text = self.question.results[0].question
                self.questionLabel.reloadInputViews()
                self.setAnswersToButtons()
                
                print("Correct Answer: \(self.question.results[0].correct_answer)")
                
                self.activityView.stopAnimating()
                self.disableBlur()
            }
        }
    }
    
    // MARK: - PREPARE UI
    
    fileprivate func prepareUI() {
        prepareNavigationItems(title: "WHO KNOWS", backButtonTitle: "Back")
        prepareLayers()
    }
    
    fileprivate func prepareLayers() {
        button1.prepareWhiteButton()
        button2.prepareWhiteButton()
        button3.prepareWhiteButton()
        button4.prepareWhiteButton()
        categoryLabel.prepareLabel()
        categoryLabel.text = pickedCategoryName.uppercased()
        questionNumberLabel.text = "Question #\(questionCounter)"
        questionLabel.prepareLabel()
        totalPointsLabel.text = "\(player.score)"
        timerLabel.text = "\(timeLeft)"
    }
    
    // MARK: - ACTIONS
    
    @IBAction func button1touched(_ sender: Any) {
        self.button1.layer.backgroundColor = UIColor.gray.cgColor
       
        if self.randomNumber == self.button1.tag {
            playCorrectButtonSound()
            self.button1.layer.backgroundColor = UIColor.green.cgColor
            self.timer?.invalidate()
            
            DispatchQueue.main.asyncAfter(deadline: DispatchTime.now() + 1) {
                self.button1.prepareWhiteButton()
                self.refreshIfAnswerTrue()
            }
        }
        
        else {
            playIncorrectButtonSound()
            
            self.button1.layer.backgroundColor = UIColor.red.cgColor
            
            if self.randomNumber == self.button2.tag {
                self.button2.layer.backgroundColor = UIColor.green.cgColor
            }
            
            if self.randomNumber == self.button3.tag {
                self.button3.layer.backgroundColor = UIColor.green.cgColor
            }
            
            if self.randomNumber == self.button4.tag {
                self.button4.layer.backgroundColor = UIColor.green.cgColor
            }
            self.timer?.invalidate()
            
            DispatchQueue.main.asyncAfter(deadline: DispatchTime.now() + 1) {
                self.instantiateScorePageViewController()
            }
        }
    }
    
    
    
    @IBAction func button2touched(_ sender: Any) {
        button2.layer.backgroundColor = UIColor.gray.cgColor
        
        if self.randomNumber == self.button2.tag {
            playCorrectButtonSound()
            self.button2.layer.backgroundColor = UIColor.green.cgColor
            self.timer?.invalidate()
            
            DispatchQueue.main.asyncAfter(deadline: DispatchTime.now() + 1) {
                self.button2.prepareWhiteButton()
                self.refreshIfAnswerTrue()
            }
        }
        
        else {
            playIncorrectButtonSound()
            
            self.button2.layer.backgroundColor = UIColor.red.cgColor
            
            if self.randomNumber == self.button1.tag {
                self.button1.layer.backgroundColor = UIColor.green.cgColor
            }
            
            if self.randomNumber == self.button3.tag {
                self.button3.layer.backgroundColor = UIColor.green.cgColor
            }
            
            if self.randomNumber == self.button4.tag {
                self.button4.layer.backgroundColor = UIColor.green.cgColor
            }
            self.timer?.invalidate()
            
            DispatchQueue.main.asyncAfter(deadline: DispatchTime.now() + 2) {
                self.instantiateScorePageViewController()
            }
        }
    }
    
    
    @IBAction func button3touched(_ sender: Any) {
        button3.layer.backgroundColor = UIColor.gray.cgColor
        
        if self.randomNumber == self.button3.tag {
            playCorrectButtonSound()
            self.button3.layer.backgroundColor = UIColor.green.cgColor
            self.timer?.invalidate()
            
            DispatchQueue.main.asyncAfter(deadline: DispatchTime.now() + 2) {
                self.button3.prepareWhiteButton()
                self.refreshIfAnswerTrue()
            }
        }
        
        else {
            playIncorrectButtonSound()
            
            self.button3.layer.backgroundColor = UIColor.red.cgColor
            
            if self.randomNumber == self.button1.tag {
                self.button2.layer.backgroundColor = UIColor.green.cgColor
            }
            
            if self.randomNumber == self.button2.tag {
                self.button1.layer.backgroundColor = UIColor.green.cgColor
            }
            
            if self.randomNumber == self.button4.tag {
                self.button4.layer.backgroundColor = UIColor.green.cgColor
            }
            self.timer?.invalidate()
            
            DispatchQueue.main.asyncAfter(deadline: DispatchTime.now() + 2) {
                self.instantiateScorePageViewController()
            }
        }
    }
    
    
    
    @IBAction func button4touched(_ sender: Any) {
        button4.layer.backgroundColor = UIColor.gray.cgColor
        
        if self.randomNumber == self.button4.tag {
            playCorrectButtonSound()
            self.button4.layer.backgroundColor = UIColor.green.cgColor
            self.timer?.invalidate()
            
            DispatchQueue.main.asyncAfter(deadline: DispatchTime.now() + 2) {
                self.button4.prepareWhiteButton()
                self.refreshIfAnswerTrue()
            }
        }
        
        else {
            playIncorrectButtonSound()
            
            self.button4.layer.backgroundColor = UIColor.red.cgColor
            
            if self.randomNumber == self.button1.tag {
                self.button2.layer.backgroundColor = UIColor.green.cgColor
            }
            
            if self.randomNumber == self.button2.tag {
                self.button1.layer.backgroundColor = UIColor.green.cgColor
            }
            
            if self.randomNumber == self.button3.tag {
                self.button3.layer.backgroundColor = UIColor.green.cgColor
            }
            self.timer?.invalidate()
            
            DispatchQueue.main.asyncAfter(deadline: DispatchTime.now() + 2) {
                self.instantiateScorePageViewController()
            }
        }
    }
    
    // MARK: - METHODS
    
    fileprivate func setAnswersToButtons() {
        randomNumber = randomNumberGenerator()
        
        if randomNumber == button1.tag {
            button1.setButtonTitle(title: "\(question.results[0].correct_answer)")
            button2.setButtonTitle(title: "\(question.results[0].incorrect_answers[0])")
            button3.setButtonTitle(title: "\(question.results[0].incorrect_answers[1])")
            button4.setButtonTitle(title: "\(question.results[0].incorrect_answers[2])")
        }
        
        if randomNumber == button2.tag {
            button1.setButtonTitle(title: "\(question.results[0].incorrect_answers[0])")
            button2.setButtonTitle(title: "\(question.results[0].correct_answer)")
            button3.setButtonTitle(title: "\(question.results[0].incorrect_answers[1])")
            button4.setButtonTitle(title: "\(question.results[0].incorrect_answers[2])")
        }
        
        if randomNumber == button3.tag {
            button1.setButtonTitle(title: "\(question.results[0].incorrect_answers[0])")
            button2.setButtonTitle(title: "\(question.results[0].incorrect_answers[1])")
            button3.setButtonTitle(title: "\(question.results[0].correct_answer)")
            button4.setButtonTitle(title: "\(question.results[0].incorrect_answers[2])")
        }
        
        if randomNumber == button4.tag {
            button1.setButtonTitle(title: "\(question.results[0].incorrect_answers[0])")
            button2.setButtonTitle(title: "\(question.results[0].incorrect_answers[1])")
            button3.setButtonTitle(title: "\(question.results[0].incorrect_answers[2])")
            button4.setButtonTitle(title: "\(question.results[0].correct_answer)")
        }
    }
    
    fileprivate func randomNumberGenerator() -> Int {
        return Int.random(in: 1...4)
    }
    
    fileprivate func calculatePlayerScore() {
        if pickedDifficulty.lowercased() == "easy" {
            player.score += 5
        }
        
        if pickedDifficulty.lowercased() == "medium" {
            player.score += 10
        }
        
        if pickedDifficulty.lowercased() == "hard" {
            player.score += 20
        }
    }
    
    fileprivate func refreshIfAnswerTrue() {
        startTimer()
        questionCounter += 1
        calculatePlayerScore()
        questionNumberLabel.text = "Question #\(questionCounter)"
        totalPointsLabel.text = "\(player.score)"
        getQuestionsFromAPI()
    }
    
    fileprivate func startTimer() {
        timeLeft = 10
        timerImageView.tintColor = .black
        timerLabel.textColor = .black
        timer = Timer.scheduledTimer(withTimeInterval: 1.0, repeats: true) { timer in
            if self.timeLeft > -1 {
                if self.timeLeft <= 5 {
                    self.timerLabel.textColor = .red
                    self.timerImageView.tintColor = .red
                    self.timerLabel.text = "\(self.timeLeft)"
                }
                self.timerLabel.text = "\(self.timeLeft)"
                self.timeLeft -= 1
            } else {
                self.timer?.invalidate()
                self.whenTimerInvalidates()
            }
        }
    }
    
    fileprivate func whenTimerInvalidates() {
        let alertTime = UIAlertController(title: "Time's up!", message: " Number of correct answers: \(questionCounter - 1) \n Your point: \(player.score)", preferredStyle: .alert)
        alertTime.addAction(UIAlertAction(title: "OK", style: .default, handler: {_ in self.instantiateScorePageViewController()}))
        self.present(alertTime, animated: true)
    }
    
    fileprivate func instantiateScorePageViewController() {
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let scorePageViewController = storyboard.instantiateViewController(identifier: "ScorePageViewController") as! ScorePageViewController
        scorePageViewController.totalPoints = player.score
        scorePageViewController.totalTrueNumbers = self.questionCounter - 1
        scorePageViewController.player = self.player
        self.navigationController?.pushViewController(scorePageViewController, animated: true)
    }
    
    // MARK: - BUTTON SOUNDS
    
    fileprivate func playTimeoutSound() {
        do {
            self.audioPlayer = try AVAudioPlayer(contentsOf: timeoutSound)
            self.audioPlayer.play()
        } catch {
            print("Could not load voice")
        }
    }
    
    fileprivate func playCorrectButtonSound() {
        do {
            audioPlayer = try AVAudioPlayer(contentsOf: correctButtonSound)
            audioPlayer.play()
        } catch {
            print("Could not load voice")
        }
    }
    
    fileprivate func playIncorrectButtonSound() {
        do {
            audioPlayer = try AVAudioPlayer(contentsOf: incorrectButtonSound)
            audioPlayer.play()
        } catch {
            print("Could not load voice")
        }
    }
    
}
