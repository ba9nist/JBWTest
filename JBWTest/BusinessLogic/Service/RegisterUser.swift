//
//  RegisterService.swift
//  JBWTest
//
//  Created by ba9nist on 11.03.2018.
//  Copyright © 2018 ba9nist. All rights reserved.
//

import UIKit

class RegisterUser: NSObject {

    let email: String
    let password: String
    let username: String

    init(email: String, password: String, username: String) {
        self.email = email
        self.password = password
        self.username = username
    }

    func registerUser(completion: @escaping (NetworkErrorProtocol?) -> Void) {
        let model = RegisterRequestModel(username: username, email: email, password: password)
        HTTPClient.shared.sendRequest(model: model, handler: AuthenticateResponseModel()) { (response, error) in
            guard error == nil else {
                completion(error)
                return
            }
            let registerHandler = response as! AuthenticateResponseModel

            let user = UserModel(uid: registerHandler.uid, name: registerHandler.name, email: registerHandler.email, accessToken: registerHandler.accessToken, role: registerHandler.role, status: registerHandler.status)

            UserManager.shared.activeUser = user

            completion(nil)

        }
    }
 }
