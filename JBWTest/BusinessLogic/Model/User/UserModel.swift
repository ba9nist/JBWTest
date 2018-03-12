//
//  UserModel.swift
//  JBWTest
//
//  Created by ba9nist on 12.03.2018.
//  Copyright © 2018 ba9nist. All rights reserved.
//

import UIKit

class UserModel: NSObject, NSCoding {
    private static let uidKey = "uid"
    private static let nameKey = "name"
    private static let emailKey = "email"
    private static let accessTokenKey = "access_token"
    private static let roleKey = "role"
    private static let statusKey = "status"

    let uid: Int
    let name: String
    let email: String
    let accessToken: String
    let role: Int
    let status: Int

    init(uid: Int, name: String, email: String, accessToken: String, role: Int, status: Int) {
        self.uid = uid
        self.name = name
        self.email = email
        self.accessToken = accessToken
        self.role = role
        self.status = status

        super.init()
    }

    required convenience init(coder decoder: NSCoder) {
        let uid = decoder.decodeInteger(forKey: UserModel.uidKey)
        let name = decoder.decodeObject(forKey: UserModel.nameKey) as! String
        let email = decoder.decodeObject(forKey: UserModel.emailKey) as! String
        let accesssToken = decoder.decodeObject(forKey: UserModel.accessTokenKey) as! String
        let role = decoder.decodeInteger(forKey: UserModel.roleKey)
        let status = decoder.decodeInteger(forKey: UserModel.statusKey)

        self.init(uid: uid, name: name, email: email, accessToken: accesssToken, role: role, status: status)
    }

    func encode(with coder: NSCoder) {
        coder.encode(uid, forKey: UserModel.uidKey)
        coder.encode(name, forKey: UserModel.nameKey)
        coder.encode(email, forKey: UserModel.emailKey)
        coder.encode(accessToken, forKey: UserModel.accessTokenKey)
        coder.encode(role, forKey: UserModel.roleKey)
        coder.encode(status, forKey: UserModel.statusKey)
    }
}
