//
//  LoginProtocol.swift
//  ViperArchitectureDemo
//
//  Created by rumi on 11/15/18.
//  Copyright © 2018 rumi. All rights reserved.
//

import Foundation
import UIKit

protocol ViewToPresenterProtocol: class {
    var view: PresenterToViewProtocol? {get set}
    var interactor: PresenterToInteractorProtocol? {get set}
    var router: PresenterToRouterProtocol? {get set}
    func startFetchingUser(username: String, password: String)
    func showNextController(navigationController: UINavigationController, userName: String)
    
}

protocol PresenterToViewProtocol: class {
    func showUser(user : UserResponseModel)
    func showError()
}

protocol PresenterToRouterProtocol: class {
    static func createModule() -> LoginViewController
    func pushToNextScreen(navigationController : UINavigationController, userName: String)
}

protocol PresenterToInteractorProtocol: class {
    var presenter:InteractorToPresenterProtocol? {get set}
    func fetchUser(username: String, password: String)
}

protocol InteractorToPresenterProtocol: class {
    func noticeFetchedSuccess(user:UserResponseModel)
    func noticeFetchFailed()
}
