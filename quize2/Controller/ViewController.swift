//
//  ViewController.swift
//  quize2
//
//  Created by Дмитрий Тимаров on 19.11.2023.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var nameTextField: UITextField!
    @IBOutlet weak var secondNameTextField: UITextField!
    
    
    
    
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
    
    override func viewWillAppear(_ animated: Bool) {
        tableView.reloadData()
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.delegate = self
        tableView.dataSource = self
        
        
        
       
        
    }
    
    @IBAction func onClickStart(_ sender: Any) {
        guard let firstName =  nameTextField.text ,!firstName.isEmpty,
              let secondName = secondNameTextField.text, !secondName.isEmpty else {
            
            let alert = UIAlertController(title: "Помилка", message: "Введіть ім'я та прізвище", preferredStyle: .alert)
            alert.addAction(UIAlertAction(title: "Ок", style: .default, handler: nil))
            present(alert, animated: true, completion: nil)
            return
        }
        
        if let enteredText =  nameTextField.text {
            UserDefaults.standard.set(enteredText, forKey: KeysDefaults.keyName)
        }
        
        if let enteredText2 = secondNameTextField.text {
            UserDefaults.standard.set(enteredText2, forKey: KeysDefaults.keySecondName)
        }
        
        
        guard let vc = storyboard?.instantiateViewController(identifier: "QuizeViewController") as? QuizeViewController else { return }
        self.navigationController?.pushViewController(vc, animated: true)
        
    }
    
    @IBAction func onClickResult(_ sender: Any) {
//        tableView.reloadData()
    }
    
    
}

extension ViewController: UITableViewDelegate, UITableViewDataSource {
    public func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    
    public func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "cell") as? ResultTableViewCell else { return UITableViewCell() }
        
        if let firstName = UserDefaults.standard.string(forKey: KeysDefaults.keyName), let secondName = UserDefaults.standard.string(forKey: KeysDefaults.keySecondName),let result =  UserDefaults.standard.string(forKey: KeysDefaults.result ) {
            cell.nameTextResult.text = firstName
            cell.secondNameTextResult.text = secondName
            cell.scoreResult.text = result
        }
        
      
        
        
        return cell 
        
    }
    
    
}

