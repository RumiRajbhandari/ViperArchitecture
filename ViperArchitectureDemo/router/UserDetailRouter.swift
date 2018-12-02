//
//  UserDetailRouter.swift
//  ViperArchitectureDemo
//
//  Created by rumi on 11/18/18.
//  Copyright © 2018 rumi. All rights reserved.
//

import Foundation
import UIKit

class UserDetailRouter: UserDetailPresenterToRouterProtocol{
    
    var name: String?
    
    static var mainStoryboard: UIStoryboard{
        return UIStoryboard(name: "Main", bundle: Bundle.main)
    }
    
    static func createModule() -> UserDetailViewController {
       

        let view = mainStoryboard.instantiateViewController(withIdentifier: "UserDetailViewController") as! UserDetailViewController
        
        let presenter: UserDetailViewToPresenterProtocol & UserDetailInteractorToPresenterProtocol = UserDetailPresenter()
        let interactor: UserDetailPresenterToInteractorProtocol = UserDetailInteractor()
        let router: UserDetailPresenterToRouterProtocol = UserDetailRouter()
        
        view.presenter = presenter
        presenter.view = view
        presenter.router = router
        presenter.interactor = interactor
        interactor.presenter = presenter
        return view
    }
    
    
}
