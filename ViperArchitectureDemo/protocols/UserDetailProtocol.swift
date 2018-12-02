//
//  UserDetailProtocol.swift
//  ViperArchitectureDemo
//
//  Created by rumi on 11/18/18.
//  Copyright © 2018 rumi. All rights reserved.
//

import Foundation
import UIKit

protocol UserDetailViewToPresenterProtocol: class {
    var view: UserDetailPresenterToViewProtocol? {get set}
    var interactor: UserDetailPresenterToInteractorProtocol? {get set}
    var router: UserDetailPresenterToRouterProtocol? {get set}
    func showUser(username: String)
    
}

protocol UserDetailPresenterToViewProtocol: class {
    func showUser(user : UserResponseModel)
    func showError()
}

protocol UserDetailPresenterToRouterProtocol: class {
    static func createModule() -> UserDetailViewController
}

protocol UserDetailPresenterToInteractorProtocol: class {
    var presenter:UserDetailInteractorToPresenterProtocol? {get set}
    func showUser(username: String)
}

protocol UserDetailInteractorToPresenterProtocol: class {
    func noticeShowUserSuccess(user:UserResponseModel)
    func noticeFetchFailed()
}
