//
//  ResultViewController.swift
//  quize2
//
//  Created by Дмитрий Тимаров on 19.11.2023.
//

import UIKit

struct FinalData{
    var name: String
    var secondName: String
    var result: String
}

class ResultViewController: UIViewController {

    
    
    
    @IBOutlet weak var resultLabel: UILabel!
    
    
   var result = 0
    
    
   
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        resultLabel.text = "\(result)"
        
        UserDefaults.standard.setValue(result, forKey: KeysDefaults.result)
        
        
        // Do any additional setup after loading the view.
    }
    

    @IBAction func onClickHome(_ sender: Any) {
        
       
        
      navigationController?.popToRootViewController(animated: true)
    }
    
}
