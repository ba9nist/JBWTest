//
//  SelectLocaleViewController.swift
//  JBWTest
//
//  Created by ba9nist on 03.03.2018.
//  Copyright © 2018 ba9nist. All rights reserved.
//

import UIKit

class SelectLocaleViewController: BaseViewController {
    @IBOutlet weak var selectedLocaleLabel: UILabel!

    private let localeKey = "locale"

    var locale: String = "en_US"

    override func viewDidLoad() {
        super.viewDidLoad()
        navigationItem.title = "Please select locale"
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()

    }

    @IBAction func selectLocaleButtonClicked(_ sender: UIButton) {
        let vc = UIStoryboard.init(name: Constants.mainStoryboard, bundle: nil).instantiateViewController(withIdentifier: Constants.localePickerViewControllerID) as! LocalePickerViewController
        vc.modalPresentationStyle = .overCurrentContext
        vc.delegate = self
        present(vc, animated: true, completion: nil)
    }
    
    @IBAction func receiveMessageButtonClicked(_ sender: UIButton) {
        let vc = UIStoryboard.init(name: Constants.mainStoryboard, bundle: nil).instantiateViewController(withIdentifier: Constants.lettersViewControllerID) as! LettersViewController
        vc.locale = locale
        navigationController?.present(vc, animated: true, completion: nil)
    }

    func localLocale() {
        let defaults = UserDefaults.standard
        locale = defaults.object(forKey: localeKey) as! String
        if locale == nil {
            locale = "en_US"
        }
    }

    func saveLocale() {
        let defaults = UserDefaults.standard
        defaults.set(locale, forKey: localeKey)
        defaults.synchronize()
    }

}

extension SelectLocaleViewController: LocalePickerViewControllerDelegate {
    func localeDidSelect(localeIdentifier: String) {
        self.locale = localeIdentifier
        self.selectedLocaleLabel.text = Utils.getLanguageBy(localeIdentifier: localeIdentifier)
    }
}
