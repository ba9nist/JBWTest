//
//  LogoutRequestModel.swift
//  JBWTest
//
//  Created by ba9nist on 12.03.2018.
//  Copyright © 2018 ba9nist. All rights reserved.
//

import UIKit

class LogoutRequestModel: BaseRequestModel {


    init() {
        super.init(apiMethod: "/logout", method: .post)
    }
}
