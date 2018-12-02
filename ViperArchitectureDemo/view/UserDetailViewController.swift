//
//  UserDetailViewController.swift
//  ViperArchitectureDemo
//
//  Created by rumi on 11/18/18.
//  Copyright © 2018 rumi. All rights reserved.
//

import UIKit

class UserDetailViewController: UIViewController {
    
    var presenter: UserDetailViewToPresenterProtocol?
    var userName: String?

    @IBOutlet weak var lblGroup: UILabel!
    @IBOutlet weak var nameLbl: UILabel!
    @IBOutlet weak var lblBu: UILabel!
    
    @IBOutlet weak var menuBarItem: UIBarButtonItem!
    override func viewDidLoad() {
        super.viewDidLoad()
        
        if revealViewController() != nil {
            menuBarItem.target = self.revealViewController()
            menuBarItem.action = #selector(SWRevealViewController().revealToggle(_:))
            self.view.addGestureRecognizer(revealViewController().panGestureRecognizer())
        }
        else{
            print("Empty")
        }
    
    }

    @IBAction func btnClicked(_ sender: Any) {
        let mainTabController = storyboard?.instantiateViewController(withIdentifier: "TabLayoutViewController") as! TabLayoutViewController
        mainTabController.selectedViewController = mainTabController.viewControllers?[1]
        present(mainTabController, animated: true, completion: nil)
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

extension UserDetailViewController: UserDetailPresenterToViewProtocol{
    
    func showUser(user: UserResponseModel) {
        nameLbl.text = user.first_name! + " " + user.last_name!
        lblBu.text = user.bu_name
        lblGroup.text = user.user_group
    }
    
    func showError() {
//        userLbl.text = "Error occured"
    }
    
    
}
