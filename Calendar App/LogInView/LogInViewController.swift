//
//  SigninViewController.swift
//  Calendar App
//
//  Created by Zack Liam and Lucas on 2022-05-13.
//
import UIKit
import SwiftUI

class SigninViewController: UIViewController {
    @IBOutlet weak var theContainer2: UIView!

    @IBOutlet weak var Pass: UIButton!
   

    
    func showscreen()  {
        
        
        
        if fire == true {
            let storyBoard : UIStoryboard = UIStoryboard(name: "Main", bundle:nil)

            let nextViewController = storyBoard.instantiateViewController(withIdentifier: "HomeViewController") as! HomeViewController
            self.present(nextViewController, animated:true, completion:nil)
        }
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        

        let childView = UIHostingController(rootView: LoginViewSwiftUI() )
        addChild(childView)
        childView.view.frame = theContainer2.bounds
        theContainer2.addSubview(childView.view)
        childView.didMove(toParent: self)
    }
   


}


