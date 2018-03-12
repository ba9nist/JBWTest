//
//  LoginModel.swift
//  JBWTest
//
//  Created by ba9nist on 12.03.2018.
//  Copyright © 2018 ba9nist. All rights reserved.
//

import UIKit
import Alamofire

class LoginRequestModel: BaseRequestModel {
    let emailKey = "email"
    let passwordKey = "password"

    let email: String
    let password: String

    init(email: String, password: String) {
        self.email = email
        self.password = password

        super.init(apiMethod: "/login", method: .post)
    }

    override func getParameters() -> Parameters? {
        return [emailKey: email, passwordKey: password]
    }
}
