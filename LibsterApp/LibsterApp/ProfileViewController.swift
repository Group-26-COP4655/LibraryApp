//
//  ProfileViewController.swift
//  LibsterApp
//
//  Created by Geo on 11/22/22.
//  Copyright © 2022 Geo. All rights reserved.
//

import UIKit
import Parse

class ProfileViewController: UIViewController {

    
    @IBAction func logoutButton(_ sender: Any) {
                let main = UIStoryboard(name: "Main", bundle: nil)
        
                let welcomeController = main.instantiateViewController(withIdentifier: "WelcomeViewController")
        
                guard let windowScene = UIApplication.shared.connectedScenes.first as? UIWindowScene, let delegate = windowScene.delegate as? SceneDelegate else {return}
        
                PFUser.logOut()
        
                delegate.window?.rootViewController = welcomeController
    }
    
    
    
    
    
    
    
    
    
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
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
