//
//  GetTextRequestModel.swift
//  JBWTest
//
//  Created by ba9nist on 12.03.2018.
//  Copyright © 2018 ba9nist. All rights reserved.
//

import UIKit

class GetTextRequestModel: BaseRequestModel {
    init() {
        super.init(apiMethod: "get/text", method: .get)
    }

}
