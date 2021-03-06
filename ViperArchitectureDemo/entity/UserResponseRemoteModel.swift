//
//  UserResponseRemoteModel.swift
//  ViperArchitectureDemo
//
//  Created by rumi on 11/25/18.
//  Copyright © 2018 rumi. All rights reserved.
//

import Foundation
import ObjectMapper

class UserResponseRemoteModel: Mappable {
    
    var message : String = ""
    var status_code: Int = 0
    var debug_code: Int = 0
    var data: UserResponseModel?
    
    required init?(map: Map) {
        
    }
    
    func mapping(map: Map) {
        debug_code <- map["debug_code"]
        message <- map["message"]
        status_code <- map["status_code"]
        data <- map["data"]
    }
    
}
