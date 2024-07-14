//
//  QuestionBuilderViewController.swift
//  QuizApp
//
//  Created by Bhawar Gujral on 2024-07-05.
//

import UIKit

protocol AddQuestionServiceProtocolDelegte{
    func questionAddedSuccess(newQuestion : Question)
    func cancelClicked()
}

class QuestionBuilderViewController: UIViewController {


    static var shared = QuestionBuilderViewController()
    
    var delegate : AddQuestionServiceProtocolDelegte?
    
    
    @IBOutlet weak var questionText: UITextField!
    
    
    @IBOutlet weak var correctOptionText: UITextField!
    
    @IBOutlet weak var incorrectOptionText1: UITextField!
    
    
    @IBOutlet weak var incorrectOptionText2: UITextField!
    
    
    @IBOutlet weak var incorrectOptionText3: UITextField!
    
    var sender = ""
    var selectedQuestion:Question? = nil
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        if sender == "EditQuestion"{
            questionText.text! = selectedQuestion!.question
            correctOptionText.text! = selectedQuestion!.correctOption
            incorrectOptionText1.text! = selectedQuestion!.incorrectOption1
            incorrectOptionText2.text! = selectedQuestion!.incorrectOption2
            incorrectOptionText3.text! = selectedQuestion!.incorrectOption3
        }
    }
    

    @IBAction func doneClicked(_ sender: Any) {
        if validateQuestionFields(question: questionText.text!, correctOption: correctOptionText.text!, incorrectOption1: incorrectOptionText1.text!, incorrectOption2: incorrectOptionText2.text!, incorrectOption3: incorrectOptionText3.text!) == false {
            let alert = UIAlertController(title: "Incorrect Input", message: "Please enter all fields!", preferredStyle: .alert)
            let alertAction = UIAlertAction(title: "Okay", style: .destructive)
            alert.addAction(alertAction)
            present(alert,animated: true)
            return
        }
        let newQues = Question(question: questionText.text!, correctOption: correctOptionText.text!, incorrectOption1: incorrectOptionText1.text!, incorrectOption2: incorrectOptionText2.text!, incorrectOption3: incorrectOptionText3.text!)
        self.delegate?.questionAddedSuccess(newQuestion: newQues)
    }
    
    @IBAction func cancelClicked(_ sender: Any) {
        let alert = UIAlertController(title: "Discard Question", message: "Are you sure you want to discard these changes? ", preferredStyle: .actionSheet)
        
        let alertAction1 = UIAlertAction(title: "Discard Changes", style: .destructive) { action in
            self.dismiss(animated: true)
            return
        }
        
        let alertAction2 = UIAlertAction(title: "Keep Editing", style: .default) { action in
            return
        }
        alert.addAction(alertAction1)
        alert.addAction(alertAction2)
        present(alert,animated: true)
        return
    }
    
    func validateQuestionFields(question: String?, correctOption: String?, incorrectOption1: String?, incorrectOption2: String?, incorrectOption3: String?) -> Bool {
        // Check if all fields are not nil and not empty
        guard let question = question, !question.isEmpty,
              let correctOption = correctOption, !correctOption.isEmpty,
              let incorrectOption1 = incorrectOption1, !incorrectOption1.isEmpty,
              let incorrectOption2 = incorrectOption2, !incorrectOption2.isEmpty,
              let incorrectOption3 = incorrectOption3, !incorrectOption3.isEmpty else {
            return false
        }
        return true
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
