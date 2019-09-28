//
//  ViewController.swift
//  Constructify
//
//  Created by Earth Maniebo on 28/09/2019.
//  Copyright © 2019 Earth Maniebo. All rights reserved.
//

import UIKit

class LoginViewController: UIViewController {

    @IBOutlet weak var passwordTextField: UITextField!
    
    @IBAction func didTapLogin(_ sender: Any) {
        self.performSegue(withIdentifier: "mainSegue", sender: self)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        passwordTextField.text = "password"
        navigationController?.navigationBar.isHidden = true
    }
    
    override var preferredStatusBarStyle: UIStatusBarStyle {
        return .lightContent
    }
    
}

