//
//  ViewController.swift
//  quize2
//
//  Created by Дмитрий Тимаров on 19.11.2023.
//

import UIKit

class ViewController: UIViewController {
    
 
    
    
    @IBOutlet weak var startButton: UIButton! {
        didSet {
            startButton.layer.cornerRadius = startButton.frame.height/2
        }
    }
    @IBOutlet weak var resultsButton: UIButton! {
        didSet {
            resultsButton.layer.cornerRadius = resultsButton.frame.height/2
        }
    }
    
   
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        
        
        
    }
    
    @IBAction func onClickStart(_ sender: Any) {
        guard let vc = storyboard?.instantiateViewController(identifier: "QuizeViewController") as? QuizeViewController else { return }
        self.navigationController?.pushViewController(vc, animated: true)
        
    }
    
    @IBAction func onClickResult(_ sender: Any) {
    }
    
}

