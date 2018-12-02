//
//  UserInteractor.swift
//  ViperArchitectureDemo
//
//  Created by rumi on 11/15/18.
//  Copyright © 2018 rumi. All rights reserved.
//

import Foundation
import Alamofire
import SwiftyJSON
import UIKit
import AlamofireObjectMapper


class UserInteractor: PresenterToInteractorProtocol{
    var presenter: InteractorToPresenterProtocol?
    
    
//    var presenter: InteractorToPresenterProtocol?
    let url = "https://bfa94eca-cb8f-4351-99e1-0e21c61915f6.mock.pstmn.io/user/supervisor/"
    let login = "authenticate"
    
    
    func fetchUser(username: String, password: String) {
        print("The user name is ", username, "The password is " , password)
        let parameters = [
            "username": username,
            "password": password
        ]
        
//
        
        Alamofire.request(url+login, method: .post, parameters: parameters, encoding: JSONEncoding.default, headers: nil)
            .responseObject { (response: DataResponse<BaseEntity<UserResponseModel>>) in
                let userReponseModel = response.result.value
                if(userReponseModel?.status_code == 200){
                    self.presenter?.noticeFetchedSuccess(user: userReponseModel!.data!)
                }
                }
        
        
    }
    
    
}
