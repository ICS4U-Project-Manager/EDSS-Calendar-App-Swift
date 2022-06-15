//
//  DayViewController.swift
//  Calendar App
//
//  Created by Zack Liam and Lucas on 2022-05-16.
//

import UIKit

class DayViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()

            let buttonX = 150
            let buttonY = 150
            let buttonWidth = 300
            let buttonHeight = 50

            let button = UIButton(type: .system)
            button.setTitle("\(selectedDate)", for: .normal)
            button.tintColor = .white
            button.backgroundColor = .red
            button.addTarget(self, action: #selector(buttonClicked), for: .touchUpInside)

            button.frame = CGRect(x: buttonX, y: buttonY, width: buttonWidth, height: buttonHeight)

            self.view.addSubview(button)
        
    }
    
    @objc func buttonClicked(sender : UIButton){
            print("ok")
    }
    
}
