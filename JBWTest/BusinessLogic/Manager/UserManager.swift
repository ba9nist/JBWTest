//
//  UserManager.swift
//  JBWTest
//
//  Created by ba9nist on 12.03.2018.
//  Copyright © 2018 ba9nist. All rights reserved.
//

import UIKit

class UserManager: NSObject {
    private let userKey = "user"

    static let shared = UserManager()
    private let defaults = UserDefaults.standard

    var activeUser: UserModel? {
        didSet {
            saveUser()
        }
    }
    private override init() {
        super.init()
        loadUser()
    }


    func loadUser() {
        let data = defaults.object(forKey: userKey) as! Data
        activeUser = NSKeyedUnarchiver.unarchiveObject(with: data) as? UserModel
    }

    func saveUser() {
        guard activeUser != nil else {
            print("cant save, activeUser is nil")
            return
        }

        let encodedData = NSKeyedArchiver.archivedData(withRootObject: activeUser!)
        defaults.set(encodedData, forKey: userKey)
        defaults.synchronize()
    }

}
