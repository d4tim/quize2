//
//  ResultViewController.swift
//  quize2
//
//  Created by Дмитрий Тимаров on 19.11.2023.
//

import UIKit

class ResultViewController: UIViewController {

    @IBOutlet weak var resultLabel: UILabel!
    
    var result = 0
    
    @IBOutlet weak var random: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()
        
        random.text = "\(result)"
        resultLabel.text = "fofm"
        resultLabel.text = "\(result)"
        
        // Do any additional setup after loading the view.
    }
    

    @IBAction func onClickHome(_ sender: Any) {
        navigationController?.popToRootViewController(animated: true)
    }
    
}
