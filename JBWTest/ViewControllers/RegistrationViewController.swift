//
//  RegistrationViewController.swift
//  JBWTest
//
//  Created by ba9nist on 03.03.2018.
//  Copyright © 2018 ba9nist. All rights reserved.
//

import UIKit

class RegistrationViewController: UIViewController {
    @IBOutlet weak var emailTextField: UITextField!
    @IBOutlet weak var usernameTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    @IBOutlet weak var confirmPasswordTextField: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        emailTextField.delegate = self
        usernameTextField.delegate = self
        passwordTextField.delegate = self
        confirmPasswordTextField.delegate = self

    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()

    }
    
    @IBAction func signupButtonClicked(_ sender: UIButton) {
        let destination = UIStoryboard(name: Constants.mainStoryboard, bundle: nil).instantiateViewController(withIdentifier: Constants.loginViewControllerID)
        present(destination, animated: true, completion: nil)
    }
    
    @IBAction func registerButtonClicked(_ sender: Any) {
        guard let email = emailTextField.text else {
            showAlert(msg: "Please input email address")
            return
        }

        guard let name = usernameTextField.text else {
            showAlert(msg: "Please enter username")
            return
        }

        guard let password = passwordTextField.text, let confirmPassword = confirmPasswordTextField.text else {
            showAlert(msg: "Please enter password")
            return
        }

        if !password.elementsEqual(confirmPassword) {
            showAlert(msg: "Entered passwords do not match")
            return
        }

        if !Utils.validateEmail(email: email) {
            showAlert(msg: "Please check email address")
            return
        }

        let registerUser = RegisterUser(email: email, password: password, username: name)
        registerUser.registerUser { (error) in
            guard error == nil else {
                self.showAlert(msg: error!.localizedDescription)
                return
            }

            let destination = UIStoryboard.init(name: Constants.mainStoryboard, bundle: nil).instantiateViewController(withIdentifier: Constants.navigationViewControllerID)
            self.present(destination, animated: true, completion: nil)
        }

    }

    func showAlert(msg: String) {
        let alertController = UIAlertController(title: "Error", message: msg, preferredStyle: .alert)
        alertController.addAction(UIAlertAction(title: "Ok", style: .cancel, handler: nil))
        present(alertController, animated: true, completion: nil)
    }



}

extension RegistrationViewController: UITextFieldDelegate {

    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true;
    }
}
