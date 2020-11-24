//
//  MainViewController.swift
//  Tutorial-Demo
//
//  Created by 劉 天宇 on 2020/11/19.
//

import UIKit

class MainViewController: UIViewController {

    var number = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    
    override func viewWillLayoutSubviews() {
        
        if let storagedNum = LocalStorageService.loadStartNumber() {
            number = storagedNum
        }
        
        if number == 0 {
            
            Timer.scheduledTimer(timeInterval: 1.0, target: self, selector: #selector(goToTutorial), userInfo: nil, repeats: false)
            
        } else {
            
            showAlert(number: number)
        }
        
        number += 1
        print(number)
        LocalStorageService.saveStartNumber(number: number)
        
    }
    
    @objc private func goToTutorial() {
        
        guard let tutorialVC = storyboard?.instantiateViewController(withIdentifier: "tutorialVC") as? TutorialViewController else { return }
        
        present(tutorialVC, animated: true, completion: nil)
    }
    
    private func showAlert(number: Int) {
        
        let alert = UIAlertController(title: "Alert", message: "\(number)回目の起動です", preferredStyle: .alert)
        
        alert.addAction(UIAlertAction(title: "OK", style: .default, handler: nil))
        
        present(alert, animated: true)
    }
}
