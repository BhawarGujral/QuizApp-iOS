//
//  QuestionBankTableViewController.swift
//  QuizApp
//
//  Created by Bhawar Gujral on 2024-07-05.
//

import UIKit

class QuestionBankTableViewController: UITableViewController,AddQuestionServiceProtocolDelegte {
    
    
    @IBOutlet var questionsTable: UITableView!
    
    var questions = ((UIApplication.shared.delegate as? AppDelegate)?.questionBank)!
    
    var sender = ""
    

    override func viewDidLoad() {
        super.viewDidLoad()
        QuestionBuilderViewController.shared.delegate = self;
        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem
    }
//
//    override func viewWillAppear(_ animated: Bool) {
//        questions = ((UIApplication.shared.delegate as? AppDelegate)?.questionBank)!
//        questionsTable.reloadData()
//    }
    
    func questionAddedSuccess(newQuestion: Question) {
        if sender == "NewQuestion"{
            questions.append(newQuestion)
        }else if sender == "EditQuestion" {
            questions[tableView.indexPathForSelectedRow!.row] = newQuestion
        }
        (UIApplication.shared.delegate as? AppDelegate)?.questionBank = questions
        questionsTable.reloadData()
    }
    
    func cancelClicked() {
        
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "toNew"{
            let newQuestionVC  = segue.destination as? QuestionBuilderViewController
            newQuestionVC?.sender = "NewQuestion"
            self.sender = "NewQuestion"
        }else{
            let editQuestionVC  = segue.destination as? QuestionBuilderViewController
            editQuestionVC?.sender = "EditQuestion"
            self.sender = "EditQuestion"
            editQuestionVC?.selectedQuestion = questions[tableView.indexPathForSelectedRow!.row]
        }
    }
    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 0
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return questions.count
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell") as! QuestionTableViewCell
        cell.questionLabel.text = questions[indexPath.row].question
        cell.correctOptionLabel.text = questions[indexPath.row].correctOption
        cell.incorrectOptionLabel1.text = questions[indexPath.row].incorrectOption1
        cell.incorrectOptionLabel2.text = questions[indexPath.row].incorrectOption2
        cell.incorrectOptionLabel3.text = questions[indexPath.row].incorrectOption3

        return cell
    }
    

    /*
    // Override to support conditional editing of the table view.
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }
    */

    /*
    // Override to support editing the table view.
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            // Delete the row from the data source
            tableView.deleteRows(at: [indexPath], with: .fade)
        } else if editingStyle == .insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }    
    }
    */

    /*
    // Override to support rearranging the table view.
    override func tableView(_ tableView: UITableView, moveRowAt fromIndexPath: IndexPath, to: IndexPath) {

    }
    */

    /*
    // Override to support conditional rearranging of the table view.
    override func tableView(_ tableView: UITableView, canMoveRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the item to be re-orderable.
        return true
    }
    */

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
