//
//  UnauthorizedError.swift
//  JBWTest
//
//  Created by ba9nist on 12.03.2018.
//  Copyright © 2018 ba9nist. All rights reserved.
//

import UIKit

class UnauthorizedError: NetworkErrorProtocol {

    let messageKey = "message"
    let codeKey = "code"

    var localizedDescription: String
    var localizedTitle: String
    var code: Int

    init(json: NSDictionary) {
        print(json)

        localizedTitle = "ValidationError"
        localizedDescription = json.object(forKey: messageKey) as! String
        code = json.object(forKey: codeKey) as! Int
    }

}
