//
//  UserRouter.swift
//  ViperArchitectureDemo
//
//  Created by rumi on 11/15/18.
//  Copyright © 2018 rumi. All rights reserved.
//

import Foundation
import UIKit

class UserRouter: PresenterToRouterProtocol{
    
    static var mainStoryboard: UIStoryboard{
        return UIStoryboard(name: "Main", bundle: Bundle.main)
    }
    
    static func createModule() -> LoginViewController {
        let view = mainStoryboard.instantiateViewController(withIdentifier: "LoginViewController") as! LoginViewController
        let presenter: ViewToPresenterProtocol & InteractorToPresenterProtocol = UserPresenter()
        let interactor: PresenterToInteractorProtocol = UserInteractor()
        let router: PresenterToRouterProtocol = UserRouter()
        
        view.presenter = presenter
        presenter.view = view
        presenter.router = router
        presenter.interactor = interactor
        interactor.presenter = presenter
        return view
    }
    
    func pushToNextScreen(navigationController: UINavigationController, userName: String) {
//        let userModule = UserDetailRouter.createModule()
//        userModule.userName = userName
//        navigationController.pushViewController(userModule, animated: true)
        
        
    }
    
    
    
}
