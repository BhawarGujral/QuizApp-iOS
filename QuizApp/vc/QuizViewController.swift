//
//  QuizViewController.swift
//  QuizApp
//
//  Created by Bhawar Gujral on 2024-07-10.
//

import UIKit

class QuizViewController: UIViewController {
    
    var questions = ((UIApplication.shared.delegate as? AppDelegate)?.questionBank)!
    
    var questionIndex = 0;
    
    var correctAnswer = 0;
    
    var selectedOption: String?
    
    @IBOutlet weak var firstOptionButton: UIButton!
    @IBOutlet weak var secondOptionButton: UIButton!
    @IBOutlet weak var thirdOptionButton: UIButton!
    @IBOutlet weak var fourthOptionButton: UIButton!
    
    @IBOutlet weak var questionText: UILabel!
    
    
    @IBOutlet weak var firstOptionText: UILabel!
    
    
    @IBOutlet weak var secondOptionText: UILabel!
    
    @IBOutlet weak var thirdOptionText: UILabel!
    
    @IBOutlet weak var fourthOptionText: UILabel!
    
    @IBOutlet weak var slider: UISlider!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        questions.shuffle()
        slider.minimumValue = 0
        slider.maximumValue = Float(questions.count-1)
        slider.value = 0
        setQuestion()
        // Do any additional setup after loading the view.
        
        
    }
    
    
    @IBAction func firstOptionRadio(_ sender: Any?) {
        resetRadioButtons()
        firstOptionButton.setImage(UIImage(systemName: "circle.fill"), for: .normal)
        selectedOption = firstOptionText.text
    }
    
    @IBAction func secondOptionRadio(_ sender: Any?) {
        resetRadioButtons()
        secondOptionButton.setImage(UIImage(systemName: "circle.fill"), for: .normal)
        selectedOption = secondOptionText.text
        
    }
    
    @IBAction func thirdOptionRadio(_ sender: Any?) {
        resetRadioButtons()
        thirdOptionButton.setImage(UIImage(systemName: "circle.fill"), for: .normal)
        selectedOption = thirdOptionText.text
    }
    
    @IBAction func fourthOptionRadio(_ sender: Any?) {
        resetRadioButtons()
        fourthOptionButton.setImage(UIImage(systemName: "circle.fill"), for: .normal)
        selectedOption = fourthOptionText.text
    }
    
    @IBAction func nextBtnClicked(_ sender: Any) {
        
        if let selectedOption = selectedOption {
            checkAnswer(selectedOption: selectedOption)
        }else {
            let alert = UIAlertController(title: "Error!", message: "No Option Selected", preferredStyle: .alert)
            alert.addAction(UIAlertAction(title: "Ok", style: .default))
            present(alert,animated: true)
            return
        }
        
        if questionIndex < questions.count - 1 {
            questionIndex += 1
            setQuestion()
            slider.value = Float(questionIndex)
        } else {
            performSegue(withIdentifier: "toResult", sender: correctAnswer)
        }
        
    }
    
//    @IBAction func prevBtnClicked(_ sender: Any) {
//        if questionIndex > 0 {
//            questionIndex -= 1
//            setQuestion()
//            slider.value = Float(questionIndex)
//        }
//    
//    }
    
    func setQuestion(){
        let currentQuestion = questions[questionIndex]
        
        // Create an array of options and shuffle it
        var options = [currentQuestion.correctOption, currentQuestion.incorrectOption1, currentQuestion.incorrectOption2, currentQuestion.incorrectOption3]
        options.shuffle()
        
        // Set the question text and the options
        questionText.text = currentQuestion.question
        questionText.numberOfLines = 0
        firstOptionText.text = options[0]
        secondOptionText.text = options[1]
        thirdOptionText.text = options[2]
        fourthOptionText.text = options[3]
        resetRadioButtons()
        selectedOption = nil
    
    }
    
    func resetRadioButtons() {
        firstOptionButton.setImage(UIImage(systemName: "circle"), for: .normal)
        secondOptionButton.setImage(UIImage(systemName: "circle"), for: .normal)
        thirdOptionButton.setImage(UIImage(systemName: "circle"), for: .normal)
        fourthOptionButton.setImage(UIImage(systemName: "circle"), for: .normal)
    }
    
    func checkAnswer(selectedOption: String) {
        let currentQuestion = questions[questionIndex]
        if selectedOption == currentQuestion.correctOption {
           correctAnswer += 1
        }
        print(correctAnswer)
    }

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "toResult"{
            let resultVC  = segue.destination as? ResultViewController
            resultVC?.correctAnswers = correctAnswer
        }
    }
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
