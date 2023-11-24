//
//  ResultTableViewCell.swift
//  quize2
//
//  Created by Дмитрий Тимаров on 22.11.2023.
//

import UIKit

class ResultTableViewCell: UITableViewCell {
    
    @IBOutlet weak var nameTextResult: UILabel!
    
    @IBOutlet weak var secondNameTextResult: UILabel!
    
    @IBOutlet weak var scoreResult: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        
        
        
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
