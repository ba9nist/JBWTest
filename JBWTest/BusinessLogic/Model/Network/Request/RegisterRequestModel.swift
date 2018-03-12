//
//  RegisterModel.swift
//  JBWTest
//
//  Created by ba9nist on 03.03.2018.
//  Copyright © 2018 ba9nist. All rights reserved.
//

import UIKit
import Alamofire

class RegisterRequestModel: BaseRequestModel {

    let nameKey = "name"
    let emailKey = "email"
    let passwordKey = "password"

    let email: String
    let username: String
    let password: String

    init(username: String, email: String, password: String) {
        self.email = email
        self.username = username
        self.password = password

        super.init(apiMethod: "/signup", method: .post)
    }

    override func getParameters() -> Parameters {
        return [nameKey: username, emailKey: email, passwordKey: password]
    }

}
