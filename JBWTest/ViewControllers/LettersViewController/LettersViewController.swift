//
//  LettersViewController.swift
//  JBWTest
//
//  Created by ba9nist on 03.03.2018.
//  Copyright © 2018 ba9nist. All rights reserved.
//

import UIKit

class LettersViewController: BaseViewController {

    @IBOutlet weak var receivedMessageTextView: UITextView!
    @IBOutlet weak var lettersTableView: UITableView!

    private let cellIdentifier = "LettersTableViewCell"

    var locale: String! = "en_US"
    var message: String = ""
    var letters = [Character: Int]()

    override func viewDidLoad() {
        super.viewDidLoad()

        lettersTableView.register(UINib(nibName: "LettersTableViewCell", bundle: nil), forCellReuseIdentifier: cellIdentifier)
        
        lettersTableView.tableFooterView = UIView()
        lettersTableView.allowsSelection = false

        loadMessage()
    }


    @IBAction func receiveNewMessageButtonClicked(_ sender: UIButton) {
        loadMessage()
    }

    func loadMessage() {
        print("locale = \(locale)")
        let service = LoadMesssage(accessToken: UserManager.shared.activeUser!.accessToken, locale: locale)
        service.load { (message, error) in
            guard error == nil else {
                self.showAlert(msg: error!.localizedDescription)
                return
            }

            self.message = message
            self.receivedMessageTextView.text = message
            self.countLetters(message: message)
            self.lettersTableView.reloadData()
        }
    }

    func showAlert(msg: String) {
        let alertController = UIAlertController(title: "Error", message: msg, preferredStyle: .alert)
        alertController.addAction(UIAlertAction(title: "Ok", style: .cancel, handler: nil))
        present(alertController, animated: true, completion: nil)
    }

    func countLetters(message: String) {

        for index in message.indices {
            let char = message[message.index(index, offsetBy: 0)]
            if (letters.keys.contains(char)) {
                letters[char] = letters[char]! + 1
            } else {
                letters[char] = 0
            }
        }
    }
    
}

extension LettersViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return letters.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: cellIdentifier, for: indexPath) as! LettersTableViewCell
        let key = Array(letters.keys)[indexPath.row]
        cell.setupData(letter: key, quantity: letters[key]!)
        return cell
    }
}
