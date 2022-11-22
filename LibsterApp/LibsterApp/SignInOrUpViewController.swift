//
//  SignInOrUpViewController.swift
//  LibsterApp
//
//  Created by Geo on 11/14/22.
//  Copyright © 2022 Geo. All rights reserved.
//

import UIKit

class SignInOrUpViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        keepUserLogged()
        // Do any additional setup after loading the view.
    }
    
    
    override func viewDidAppear(_ animated: Bool) {
//        if UserDefaults.standard.bool(forKey: "userLoggedIn") == true {
//            self.performSegue(withIdentifier: "logInToDash", sender: self)
//        }
    }
    
    
    func keepUserLogged() {
//        UserDefaults.standard.set(true, forKey: "userLoggedIn")
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
