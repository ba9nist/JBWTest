//
//  Utils.swift
//  JBWTest
//
//  Created by ba9nist on 03.03.2018.
//  Copyright © 2018 ba9nist. All rights reserved.
//

import UIKit

class Utils: NSObject {

    static func validateEmail(email: String) -> (Bool) {
        let emailRegEx = "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,64}"

        let emailTest = NSPredicate(format:"SELF MATCHES %@", emailRegEx)
        return emailTest.evaluate(with: email)
    }

    static func getLanguageBy(localeIdentifier: String) -> String {
        let language = NSLocale(localeIdentifier: localeIdentifier).localizedString(forLocaleIdentifier: localeIdentifier)
        return language.count == 0 ? localeIdentifier : language
    }
}
