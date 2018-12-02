//
//  ViewController.swift
//  ViperArchitectureDemo
//
//  Created by rumi on 11/15/18.
//  Copyright © 2018 rumi. All rights reserved.
//

import UIKit

class LoginViewController: UIViewController {
    
    var presenter: ViewToPresenterProtocol?

    @IBOutlet weak var lblLogin: UILabel!
    @IBOutlet weak var lblName: UITextField!
    @IBOutlet weak var lblPassword: UITextField!
    
    @IBAction func loginBtnClicked(_ sender: Any) {
        let userName = lblName.text
        let password = lblPassword.text
        if(userName != nil && password != nil){
            presenter?.startFetchingUser(username: userName!, password: password!)
        }
        
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

extension LoginViewController: PresenterToViewProtocol{
    func showUser(user: UserResponseModel) {
        lblLogin.text = user.bu_name
        let userDetailModule = UserDetailRouter.createModule()
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        
        let sw = storyboard.instantiateViewController(withIdentifier: "SWRevealViewController") as! SWRevealViewController
        
        self.view.window?.rootViewController = sw
    
        presenter?.showNextController(navigationController: navigationController!, userName: user.bu_name!)
        
    }
    
    func showError() {
        lblLogin.text = "Error occured"
    }
    
    
}

