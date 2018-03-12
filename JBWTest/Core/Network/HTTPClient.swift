//
//  HTTPClient.swift
//  JBWTest
//
//  Created by ba9nist on 11.03.2018.
//  Copyright © 2018 ba9nist. All rights reserved.
//

import UIKit
import Alamofire

class HTTPClient: NSObject {

    static let shared = HTTPClient()
    private override init() {

    }

//    func sendRequest(model: BaseRequestModel, handler: BaseResponseModelProtocol, completion: @escaping (BaseResponseModelProtocol?, NetworkErrorProtocol?) -> Void) {
//        Alamofire.request(model.url, method: model.method, parameters: model.getParameters(), encoding: model.encoding, headers: model.headers).responseJSON { (response) in
//
//            print("\(model.url)   \(model.method)")
//            if let json = response.result.value {
//                switch (response.response!.statusCode) {
//                    case 200:
//                        handler.parseJSON(json: json as! NSDictionary)
//
//                        completion(handler, nil)
//
//                        break
//                    case 422:
//                        if json is NSDictionary {
//                            let dictionary = json as! NSDictionary
//
//                            let errors = dictionary.object(forKey: "errors") as! [NSDictionary]
//                            completion(nil, ValidationError(json: errors[0]))
//                        }
//                        break
//                    default:
//                        if json is NSDictionary {
//                            let dictionary = json as! NSDictionary
//
//                            let errors = dictionary.object(forKey: "errors") as! [NSDictionary]
//                            completion(nil, NetworkError(json: errors[0]))
//                        }
//                        break
//                    }
//                } else {
//                    completion(nil, NetworkError(code: 0, description: response.error!.localizedDescription))
//                }
//        }
//    }

   func sendRequest(model: BaseRequestModel, handler: BaseResponseModelProtocol, completion: @escaping (BaseResponseModelProtocol?, NetworkErrorProtocol?) -> Void) {

//    "success": true,
//    "data": {
//        "uid": 0,
//        "name": "string",
//        "email": "string",
//        "access_token": "string",
//        "role": 1,
//        "status": 1,
//        "created_at": 0,
//        "updated_at": 0
//    }
    sleep(1)
    switch (model) {
    case is RegisterRequestModel:
        fallthrough
    case is LoginRequestModel:
        let data: NSDictionary = [
                    "uid": "123",
                    "name": "Jekos",
                    "email": "test@gmail.com",
                    "access_token": "12345677",
                    "role": "1",
                    "status": "1",
                    "created_at": Date() - 100000,
                    "updated_at": Date(),
                    ]
        let json: NSDictionary = [
        "success": "true",
        "data": data
        ]

        print(json)
        handler.parseJSON(json: json)

        break

    case is GetTextRequestModel:
        break
    default:
        print("unknown type")
    }

    }
}
