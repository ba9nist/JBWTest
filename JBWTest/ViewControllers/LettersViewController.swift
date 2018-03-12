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
    @IBOutlet weak var lettersTableVIew: UITableView!

    override func viewDidLoad() {
        super.viewDidLoad()

    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()

    }

    @IBAction func receiveNewMessageButtonClicked(_ sender: UIButton) {
    }
    
}
