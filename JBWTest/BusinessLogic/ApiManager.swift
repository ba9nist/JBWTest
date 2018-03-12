//
//  ApiManager.swift
//  JBWTest
//
//  Created by ba9nist on 03.03.2018.
//  Copyright © 2018 ba9nist. All rights reserved.
//

import UIKit
import Alamofire

class ApiManager: NSObject {
    static let shared = ApiManager()

    private override init() {
        super.init()
    }

    func registerUser(model: RegisterRequestModel, completion: @escaping (AuthenticateResponseModel?, NetworkErrorProtocol?) -> Void) {
        Alamofire.request(model.url, method: model.method, parameters: model.getParameters(), encoding: model.encoding, headers: model.headers).responseJSON { (response) in

            print("statusCode = \(response.response?.statusCode)")
            print("result = \(response.result.value)")

            if let json = response.result.value {
                switch (response.response!.statusCode) {
                case 200:
                    let dictionary = json as! NSDictionary

                    let registerResponse = AuthenticateResponseModel()

                    break
                case 422:
                    if json is NSDictionary {
                        let dictionary = json as! NSDictionary

                        let errors = dictionary.object(forKey: "errors") as! [NSDictionary]
                        completion(nil, ValidationError(json: errors[0]))
                    }
                    break
                default:
                    if json is NSDictionary {
                        let dictionary = json as! NSDictionary

                        let errors = dictionary.object(forKey: "errors") as! [NSDictionary]
                        completion(nil, NetworkError(json: errors[0]))
                    }
                    break
                }

            } else {
                //                    print("respon")
                //                    completionHandler(nil, response.error)
            }

        }

    }
}
