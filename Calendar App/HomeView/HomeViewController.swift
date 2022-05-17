//
//  HomeScreenViewController.swift
//  Calendar App
//
//  Created by Zack Liam and Lucas on 2022-05-16.
//

import UIKit
import SwiftUI

class HomeScreenViewController: UIViewController {
    
    @IBOutlet weak var theContainer : UIView!

    override func viewDidLoad() {
        super.viewDidLoad()

        let childview = UIHostingController(rootView:
        HomeViewSwiftUI())
        addChild(childview)
        childview.view.frame = theContainer.bounds
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
