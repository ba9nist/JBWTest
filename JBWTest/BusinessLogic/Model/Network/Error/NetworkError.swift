//
//  NetworkError.swift
//  JBWTest
//
//  Created by ba9nist on 08.03.2018.
//  Copyright © 2018 ba9nist. All rights reserved.
//

import UIKit

class NetworkError: NetworkErrorProtocol {
    let fieldKey = "field"
    let messageKey = "message"

    var localizedDescription: String
    var localizedTitle = "NetworkError"
    var code: Int = 0

    init(json: NSDictionary) {
        print(json)
        localizedDescription = json.object(forKey: messageKey) as! String
    }

    init(code: Int, description: String) {
        self.code = code
        self.localizedDescription = description
    }
}
