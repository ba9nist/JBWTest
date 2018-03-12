//
//  LoginViewController.swift
//  JBWTest
//
//  Created by ba9nist on 03.03.2018.
//  Copyright © 2018 ba9nist. All rights reserved.
//

import UIKit

class LoginViewController: UIViewController {
    @IBOutlet weak var emailTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!

    override func viewDidLoad() {
        super.viewDidLoad()
    }

    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)

        if UserManager.shared.activeUser != nil {
            print("already has active user")
            self.showLettersVC()
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }


    @IBAction func registerButtonTapped(_ sender: UIButton) {
        let destination = UIStoryboard.init(name: Constants.mainStoryboard, bundle: nil).instantiateViewController(withIdentifier: Constants.registrationViewControllerID);
        self.present(destination, animated: true, completion: nil)
    }

    
    @IBAction func loginButtonTapped(_ sender: UIButton) {
        guard let email = emailTextField.text else {
            showAlert(msg: "Please input email address")
            return
        }

        guard let password = passwordTextField.text else {
            showAlert(msg: "Please enter password")
            return
        }

        if password.count < 6 {
            showAlert(msg: "Password should have at least 6 characters")
            return
        }

        if !Utils.validateEmail(email: email) {
            showAlert(msg: "Please check email address")
            return
        }

        let userService = AuthUser(email: email, password: password)
        userService.authUser { (error) in
            guard error == nil else {
                self.showAlert(msg: error!.localizedDescription)
                return
            }

            self.showLettersVC()
        }
    }

    func showLettersVC() {
        let destination = UIStoryboard.init(name: Constants.mainStoryboard, bundle: nil).instantiateViewController(withIdentifier: Constants.navigationViewControllerID)
        self.present(destination, animated: true, completion: nil)
    }

    func showAlert(msg: String) {
        let alertController = UIAlertController(title: "Error", message: msg, preferredStyle: .alert)
        alertController.addAction(UIAlertAction(title: "Ok", style: .cancel, handler: nil))
        present(alertController, animated: true, completion: nil)
    }
}
