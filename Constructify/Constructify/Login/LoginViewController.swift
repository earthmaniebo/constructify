//
//  ViewController.swift
//  Constructify
//
//  Created by Earth Maniebo on 28/09/2019.
//  Copyright © 2019 Earth Maniebo. All rights reserved.
//

import UIKit
import Alamofire
import MBProgressHUD
import ObjectMapper

class LoginViewController: UIViewController {

    @IBOutlet weak var passwordTextField: UITextField!
    
    @IBAction func didTapLogin(_ sender: Any) {
        MBProgressHUD.showAdded(to: view, animated: true)
        let parameters = ["username": "themanager", "password": "password"]
        Alamofire.request("\(ngrokAPI)/constructify/login", method: .post, parameters: parameters, encoding: JSONEncoding.default).responseJSON { response in
            MBProgressHUD.hide(for: self.view, animated: true)
            switch response.result {
            case .success:
                gProjects = Mapper<Project>().mapArray(JSONObject: response.result.value)!
                self.performSegue(withIdentifier: "mainSegue", sender: self)
            case .failure(_):
                print()
            }
        }
    }
    
    var projects = [Project]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        passwordTextField.text = "password"
        navigationController?.navigationBar.isHidden = true
    }
    
    override var preferredStatusBarStyle: UIStatusBarStyle {
        return .lightContent
    }
    
}

