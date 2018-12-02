//
//  UserDetailPresenter.swift
//  ViperArchitectureDemo
//
//  Created by rumi on 11/18/18.
//  Copyright © 2018 rumi. All rights reserved.
//

import Foundation

class UserDetailPresenter: UserDetailViewToPresenterProtocol{
    
    
    var view: UserDetailPresenterToViewProtocol?
    
    var interactor: UserDetailPresenterToInteractorProtocol?
    
    var router: UserDetailPresenterToRouterProtocol?
    
    func showUser(username: String) {
        interactor?.showUser(username: username)
    }

}

extension UserDetailPresenter: UserDetailInteractorToPresenterProtocol{
    func noticeShowUserSuccess(user: UserResponseModel) {
        view?.showUser(user: user)
    }
    
    func noticeFetchFailed() {
        view?.showError()
    }
    
    
}
