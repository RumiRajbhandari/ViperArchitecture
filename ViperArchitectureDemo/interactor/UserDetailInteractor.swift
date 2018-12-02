//
//  UserDetailInteractor.swift
//  ViperArchitectureDemo
//
//  Created by rumi on 11/18/18.
//  Copyright © 2018 rumi. All rights reserved.
//

import Foundation

class UserDetailInteractor : UserDetailPresenterToInteractorProtocol{

    
    var presenter: UserDetailInteractorToPresenterProtocol?
    
    func showUser(username: String) {
//        presenter?.noticeShowUserSuccess(user: User(id: 1, name: username))
    }
    
    
    
}
