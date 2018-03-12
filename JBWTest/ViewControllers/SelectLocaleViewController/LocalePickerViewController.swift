//
//  LocalePickerViewController.swift
//  JBWTest
//
//  Created by ba9nist on 12.03.2018.
//  Copyright © 2018 ba9nist. All rights reserved.
//

import UIKit

protocol LocalePickerViewControllerDelegate {
    func localeDidSelect(localeIdentifier: String)
}

class LocalePickerViewController: UIViewController {
    @IBOutlet weak var pickerView: UIPickerView!

    let supportedLocales = ["bg_BG", "da_DK", "el_GR", "en_NG", "en_ZA", "fi_FI", "he_IL", "ka_GE", "me_ME", "nl_NL", "pt_PT", "sr_Cyrl_RS", "tr_TR", "zh_TW", "ar_JO", "en_AU", "en_NZ", "es_AR", "hr_HR", "kk_KZ", "ro_MD", "sr_Latn_RS", "uk_UA", "ar_SA", "bn_BD", "de_AT", "en_CA", "en_PH", "es_ES", "fr_BE", "is_IS", "ko_KR", "mn_MN", "ro_RO", "sr_RS", "at_AT", "de_CH", "en_GB", "en_SG", "es_PE", "fr_CA", "hu_HU", "it_CH", "nb_NO", "ru_RU", "sv_SE", "de_DE", "en_HK", "en_UG", "es_VE", "fr_CH", "hy_AM", "it_IT", "lt_LT", "ne_NP", "pl_PL", "sk_SK", "vi_VN", "cs_CZ", "el_CY", "en_IN", "en_US", "fa_IR", "fr_FR", "id_ID", "ja_JP", "lv_LV", "nl_BE", "pt_BR", "sl_SI", "th_TH", "zh_CN"]

    var languageNames = [String]()
    var delegate: LocalePickerViewControllerDelegate? =  nil

    override func viewDidLoad() {
        super.viewDidLoad()

        for locale in supportedLocales {
            languageNames.append(Utils.getLanguageBy(localeIdentifier: locale))
        }
    }

    @IBAction func doneButtonClicked(_ sender: UIButton) {
        delegate?.localeDidSelect(localeIdentifier: supportedLocales[pickerView.selectedRow(inComponent: 0)])
        self.dismiss(animated: true, completion: nil)
    }
    
    @IBAction func cancelButtonCLicked(_ sender: UIButton) {
        self.dismiss(animated: true, completion: nil)
    }
}

extension LocalePickerViewController: UIPickerViewDelegate {
    func pickerView(_ pickerView: UIPickerView, attributedTitleForRow row: Int, forComponent component: Int) -> NSAttributedString? {

        let text = languageNames[row]
        return NSAttributedString(string: text, attributes: [NSAttributedStringKey.foregroundColor: UIColor.white])
    }
}

extension LocalePickerViewController: UIPickerViewDataSource {
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }

    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return languageNames.count
    }

}
