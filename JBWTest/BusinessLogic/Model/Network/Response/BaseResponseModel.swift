//
//  BaseResponseModel.swift
//  JBWTest
//
//  Created by ba9nist on 12.03.2018.
//  Copyright © 2018 ba9nist. All rights reserved.
//

import UIKit

class BaseResponseModel: NSObject, BaseResponseModelProtocol {
    private let successKey = "success"
    private let dataKey = "data"

    var success: Bool!
    var data: Any!

    func parseJSON(json: NSDictionary) {
        success = json.object(forKey: successKey) as! Bool
        data = json.object(forKey: dataKey)
    }

}
