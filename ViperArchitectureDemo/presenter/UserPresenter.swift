//
//  UserPresenter.swift
//  ViperArchitectureDemo
//
//  Created by rumi on 11/15/18.
//  Copyright © 2018 rumi. All rights reserved.
//

import Foundation
import UIKit

class UserPresenter: ViewToPresenterProtocol{
    
    var view: PresenterToViewProtocol?
    
    var interactor: PresenterToInteractorProtocol?
    
    var router: PresenterToRouterProtocol?
    
    func startFetchingUser(username: String, password: String) {
        interactor?.fetchUser(username: username, password: password)
    }
    
    func showNextController(navigationController: UINavigationController, userName: String) {
        router?.pushToNextScreen(navigationController: navigationController, userName: userName)
    }

    
}

extension UserPresenter: InteractorToPresenterProtocol{
    func noticeFetchedSuccess(user: UserResponseModel) {
        view?.showUser(user: user)
    }
    
    func noticeFetchFailed() {
        view?.showError()
    }
    
    
}
