//
//  EventViewController.swift
//  Calendar App
//
//  Created by Zack Liam and Lucas on 2022-05-16.
//

import UIKit

class EventViewController: UIViewController {
    var viewModel = userViewModel()
    override func viewDidLoad() {
        super.viewDidLoad()
        let user: () = viewModel.fetchData()
        let label = UILabel(frame: CGRect(x: 0, y: 0, width: 200, height: 21))
        label.center = CGPoint(x: 160, y: 285)
        label.textAlignment = .center
        label.text = "user.count"
        self.view.addSubview(label)
    }
}



