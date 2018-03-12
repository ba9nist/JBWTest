//
//  GetTextResponseModel.swift
//  JBWTest
//
//  Created by ba9nist on 12.03.2018.
//  Copyright © 2018 ba9nist. All rights reserved.
//

import UIKit

class GetTextResponseModel: BaseResponseModel {
    var text: String!

    override func parseJSON(json: NSDictionary) {
        super.parseJSON(json: json)

        text = data as! String
    }
}
