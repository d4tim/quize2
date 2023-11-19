//
//  QuizeViewController.swift
//  quize2
//
//  Created by Дмитрий Тимаров on 19.11.2023.
//

import UIKit

class QuizeViewController: UIViewController {
    
    @IBOutlet weak var collectionView: UICollectionView!
    
    
    
    
    var entitiesQuestions = [
        Questions(correct_answer: "Венера",option_1: "Марс",option_2: "Венера",option_3: "Юпітер",option_4: "Уран",question: "Яка планета є найближчою до Сонця?"),
        Questions(correct_answer: "Василь Стефаник",option_1: "Василь Стефаник",option_2: "Іван Франко",option_3: "Леся Українка",option_4: "Тарас Шевченко",question: "Хто є автором роману Тигролови?"),
        Questions(correct_answer: "1776",option_1: "1776",option_2: "1789",option_3: "1812",option_4: "1865",question: "В якому році було провозголошено День Незалежності США?"),
        Questions(correct_answer: "Вінсент Ван Гог",option_1: "Вінсент Ван Гог",option_2: "Леонардо до Вінчі",option_3: "Пабло Пікассо",option_4: "Клод Моне",question: "Хто є автором картини Зіркова ніч?")
                  
    ]
    
    var answerSelected = false
    var isCorrectAnswer = false
    
    var points = 0
    var index = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.collectionView.delegate = self
        self.collectionView.dataSource = self
        
        }
    
    override func viewWillAppear(_ animated: Bool) {
        self.navigationController?.setNavigationBarHidden(true, animated: false)
    }

    @IBAction func onClickExit(_ sender: Any) {
        navigationController?.popToRootViewController(animated: true)
    }
    
    @IBAction func onClickNext(_ sender: Any) {
        
        if !answerSelected {
            //ShowAlert
            let alert = UIAlertController(title: "Оберіть одну відповідь ", message: "Будь ласка виберіть іншу відповідь перед тим , як перейти до іншого питання ", preferredStyle: .alert)
            let okAction = UIAlertAction(title: "Ок", style: .default, handler: nil)
            alert.addAction(okAction)
            present(alert, animated: true, completion: nil)
            return
            
        }
//        answerSelected = false
        if isCorrectAnswer {
            points += 1
        }
        
        
        print(points)
        if index<(self.entitiesQuestions.count ) - 1 {
            index += 1
            collectionView.scrollToItem(at: IndexPath(row: index, section: 0), at: .right, animated: true)
            
            
            
        } else {
            // Move the user on the result controller
            guard let vc = storyboard?.instantiateViewController(identifier: "ResultViewController") as? ResultViewController else { return }
            vc.result = points
            self.navigationController?.pushViewController(vc, animated: true)
        }
        
        
        
    }
    
}

extension QuizeViewController: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return entitiesQuestions.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell =  collectionView.dequeueReusableCell(withReuseIdentifier: "QuizeCollectionViewCell", for: indexPath) as? QuizeCollectionViewCell else {
            return QuizeCollectionViewCell()
        }
        cell.optionA.layer.cornerRadius = 5
        cell.optionB.layer.cornerRadius = 5
        cell.optionC.layer.cornerRadius = 5
        cell.optionD.layer.cornerRadius = 5

        
        cell.setValue = entitiesQuestions[indexPath.row]
        cell.selectedOption = { [weak self] isCorrect in
            self?.answerSelected = true
            self?.isCorrectAnswer = isCorrect
        }
        
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: collectionView.frame.width, height: collectionView.frame.height)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 0
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        return 0
    }
    
    
}
