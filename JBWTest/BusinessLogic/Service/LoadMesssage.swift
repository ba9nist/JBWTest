//
//  LoadMesssage.swift
//  JBWTest
//
//  Created by ba9nist on 12.03.2018.
//  Copyright © 2018 ba9nist. All rights reserved.
//

import UIKit

class LoadMesssage: NSObject {


    func load(completion: @escaping (String, NetworkErrorProtocol?) -> Void) {
        let model = GetTextRequestModel()
        HTTPClient.shared.sendRequest(model: model, handler: GetTextResponseModel()) { (response, error) in
            guard error == nil else {
                completion("", error)
                return
            }

            let messageHandler = response as! GetTextResponseModel
            completion(messageHandler.text, nil)
        }
    }
}
