//
//  BaseViewController.swift
//  JBWTest
//
//  Created by ba9nist on 12.03.2018.
//  Copyright © 2018 ba9nist. All rights reserved.
//

import UIKit

class BaseViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        setupLogoutButton()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }

    func setupLogoutButton() {
        let exitButton = UIBarButtonItem.init(image: #imageLiteral(resourceName: "ic_logout"), style: .plain, target: self, action: #selector(exitButtonTapped(button:)))
        self.navigationItem.rightBarButtonItem = exitButton;
    }

    @objc func exitButtonTapped(button: UIBarButtonItem) {
        UserManager.shared.logout()
        let destination = UIStoryboard.init(name: Constants.mainStoryboard, bundle: nil).instantiateViewController(withIdentifier: Constants.loginViewControllerID)
        present(destination, animated: true, completion: nil)
    }

}
