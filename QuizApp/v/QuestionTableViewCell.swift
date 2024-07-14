//
//  QuestionTableViewCell.swift
//  QuizApp
//
//  Created by Bhawar Gujral on 2024-07-05.
//

import UIKit

class QuestionTableViewCell: UITableViewCell {
    
    
    @IBOutlet weak var questionLabel: UILabel!
    
    @IBOutlet weak var correctOptionLabel: UILabel!
    
    @IBOutlet weak var incorrectOptionLabel1: UILabel!
    
    @IBOutlet weak var incorrectOptionLabel2: UILabel!
    
    @IBOutlet weak var incorrectOptionLabel3: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
