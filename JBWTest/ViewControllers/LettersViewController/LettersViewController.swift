//
//  LettersViewController.swift
//  JBWTest
//
//  Created by ba9nist on 03.03.2018.
//  Copyright © 2018 ba9nist. All rights reserved.
//

import UIKit

class LettersViewController: BaseViewController {
    @IBOutlet weak var receivedStringLabel: UILabel!
    @IBOutlet weak var lettersTableView: UITableView!

    var locale: String! = "en_US"
    var message: String = ""

    override func viewDidLoad() {
        super.viewDidLoad()

        loadMessage()
    }


    @IBAction func receiveNewMessageButtonClicked(_ sender: UIButton) {
    }

    func loadMessage() {
        let service = LoadMesssage()
        service.load { (message, error) in
            guard error == nil else {
                self.showAlert(msg: error!.localizedDescription)
                return
            }

            self.message = message
            print(message)
            self.lettersTableView.reloadData()
        }
    }

    func showAlert(msg: String) {
        let alertController = UIAlertController(title: "Error", message: msg, preferredStyle: .alert)
        alertController.addAction(UIAlertAction(title: "Ok", style: .cancel, handler: nil))
        present(alertController, animated: true, completion: nil)
    }
    
}

extension LettersViewController: UITableViewDelegate {

}

extension LettersViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {

    }


}
