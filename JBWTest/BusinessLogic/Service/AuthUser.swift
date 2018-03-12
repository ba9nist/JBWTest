//
//  AuthUser.swift
//  JBWTest
//
//  Created by ba9nist on 12.03.2018.
//  Copyright © 2018 ba9nist. All rights reserved.
//

import UIKit

class AuthUser: NSObject {

    let email: String
    let password: String

    init(email: String, password: String) {
        self.email = email
        self.password = password
    }

    func authUser(completion: @escaping (NetworkErrorProtocol?) -> Void) {
        let model = LoginRequestModel(email: email, password: password)
        HTTPClient.shared.sendRequest(model: model, handler: AuthenticateResponseModel()) { (response, error) in
            guard error == nil else {
                completion(error)
                return
            }

            let authHandler = response as! AuthenticateResponseModel
            let user = UserModel(uid: authHandler.uid, name: authHandler.name, email: authHandler.email, accessToken: authHandler.accessToken, role: authHandler.role, status: authHandler.status)

            UserManager.shared.activeUser = user

            completion(nil)
        }
    }
}
