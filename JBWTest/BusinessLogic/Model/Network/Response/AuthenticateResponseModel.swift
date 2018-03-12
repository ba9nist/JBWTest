//
//  LoginResponseModel.swift
//  JBWTest
//
//  Created by ba9nist on 12.03.2018.
//  Copyright © 2018 ba9nist. All rights reserved.
//

import UIKit

class AuthenticateResponseModel: BaseResponseModel {
    private let uidKey = "uid"
    private let nameKey = "name"
    private let emailKey = "email"
    private let accessTokenKey = "access_token"
    private let roleKey = "role"
    private let statusKey = "status"
    private let createAtKey = "created_at"
    private let updatedAtKey = "updated_at"

    var uid: Int!
    var name: String!
    var email: String!
    var accessToken: String!
    var role: Int!
    var status: Int!
    var createdDate: Date!
    var updatedDate: Date!

    override func parseJSON(json: NSDictionary) {
        super.parseJSON(json: json)

        let dictionary = data as! NSDictionary

        uid = dictionary.object(forKey: uidKey) as! Int
        name = dictionary.object(forKey: nameKey) as! String
        email = dictionary.object(forKey: emailKey) as! String
        accessToken = dictionary.object(forKey: accessTokenKey) as! String
        role = dictionary.object(forKey: roleKey) as! Int
        status = dictionary.object(forKey: statusKey) as! Int
        createdDate = Date(timeIntervalSince1970: Double(dictionary.object(forKey: createAtKey) as! Int))
        updatedDate = Date(timeIntervalSince1970: Double(dictionary.object(forKey: updatedAtKey) as! Int))
    }
}
