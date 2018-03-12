//
//  LettersTableViewCell.swift
//  JBWTest
//
//  Created by ba9nist on 12.03.2018.
//  Copyright © 2018 ba9nist. All rights reserved.
//

import UIKit

class LettersTableViewCell: UITableViewCell {
    @IBOutlet weak var letterLabel: UILabel!
    @IBOutlet weak var quantityLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

    }

    func setupData(letter: Character, quantity: Int) {
        letterLabel.text = "\(letter)"
        quantityLabel.text = "\(quantity)"
    }
    
}
