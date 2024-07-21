//
//  ResultViewController.swift
//  QuizApp
//
//  Created by Bhawar Gujral on 2024-07-14.
//

import UIKit

class ResultViewController: UIViewController {
    
    
    @IBOutlet weak var resultText: UILabel!
    
    var correctAnswers = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        resultText.text = "The Correct Answers: " + String(correctAnswers)
        // Do any additional setup after loading the view.
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
