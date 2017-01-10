//
//  LoginViewController.swift
//  Auth0 Dummy
//
//  Created by David Bielik on 08/01/2017.
//  Copyright © 2017 David Bielik. All rights reserved.
//

import UIKit


class LoginViewController: UIViewController {

    @IBOutlet weak var usernameTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    @IBAction func singupVCUnwindSegue(segue: UIStoryboardSegue) {
        
    }

    @IBAction func loginButtonPressed(_ sender: UIButton) {
        guard let username = usernameTextField.text, let pw = passwordTextField.text else {
            NSLog("no username or pw")
            return
        }
        AuthHandler.sharedInstance.login(username: username, password: pw)
    }
    
    @IBAction func signupButtonPressed(_ sender: UIButton) {
        // segue into singupVC
    }
}

