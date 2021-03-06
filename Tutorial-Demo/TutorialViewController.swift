//
//  TutorialViewController.swift
//  Tutorial-Demo
//
//  Created by 劉 天宇 on 2020/11/19.
//

import UIKit

class TutorialViewController: UIViewController {
    
    @IBOutlet weak var scrollView: UIScrollView!
    @IBOutlet weak var stackView: UIStackView!
    @IBOutlet weak var dummySpaceView: UIView!
    @IBOutlet weak var pageControl: UIPageControl!
    @IBOutlet weak var backgroundView: UIView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        scrollView.delegate = self
        
        backgroundView.layer.cornerRadius = 15
        configureScrollView()
    }
    
    @IBAction func actionValueChanged(_ sender: UIPageControl) {
        
        let current = sender.currentPage
        scrollView.setContentOffset(CGPoint(x: CGFloat(current)*(view.frame.size.width-80), y: 0), animated: true)
    }
    
    @IBAction func actionBack(_ sender: UIButton) {
        dismiss(animated: true, completion: nil)
    }
    
    
    private func configureScrollView() {
        
        scrollView.layer.cornerRadius = 15
        stackView.removeArrangedSubview(dummySpaceView)
        dummySpaceView.removeFromSuperview()
        
        let colors: [UIColor] = [
            .systemRed,
            .systemBlue,
            .systemYellow,
            .systemGreen
        ]
        
        for i in 0..<4 {
            
            let page = UIView()
            page.widthAnchor.constraint(equalToConstant: UIScreen.main.bounds.width-80).isActive = true
            page.backgroundColor = colors[i]
            stackView.addArrangedSubview(page)
        }
    }
}

extension TutorialViewController: UIScrollViewDelegate {
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        pageControl.currentPage = Int(floorf(Float(scrollView.contentOffset.x) / Float(scrollView.frame.size.width)))
    }
}
