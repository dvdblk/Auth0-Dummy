//
//  SignupViewController.swift
//  Auth0 Dummy
//
//  Created by David Bielik on 09/01/2017.
//  Copyright © 2017 David Bielik. All rights reserved.
//

import UIKit

class SignupViewController: UIViewController {

    
    @IBOutlet weak var usernameTextField: UITextField!
    @IBOutlet weak var emailTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    @IBOutlet weak var spinner: UIActivityIndicatorView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        spinner.hidesWhenStopped = true
        // Do any additional setup after loading the view.
    }
    
    
    @IBAction func submitButtonPressed(_ sender: Any) {
        guard let em = emailTextField.text, let pw = passwordTextField.text else {
            NSLog("empty field")
            return
        }
        spinner.startAnimating()
        let username: String? = usernameTextField.text
        AuthHandler.sharedInstance.signup(email: em, username: username, password: pw, success: {
            _ in
            self.performSegue(withIdentifier: "signupVCUnwindSegue", sender: nil)
        }, failure: nil, onExit: { [unowned self] in
            self.spinner.stopAnimating()
        })
    }
}
