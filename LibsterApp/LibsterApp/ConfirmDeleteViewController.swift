//
//  ConfirmDeleteViewController.swift
//  LibsterApp
//
//  Created by Geo on 12/5/22.
//  Copyright © 2022 Geo. All rights reserved.
//

import UIKit
import Parse

class ConfirmDeleteViewController: UIViewController {

    let userObj = PFUser.current()!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    

    @IBAction func noButton(_ sender: Any) {
        self.dismiss(animated: true, completion: nil)
    }
    
    
    @IBAction func yesButton(_ sender: Any) {
        
        let main = UIStoryboard(name: "Main", bundle: nil)
        
        let welcomeController = main.instantiateViewController(withIdentifier: "WelcomeViewController")

        guard let windowScene = UIApplication.shared.connectedScenes.first as? UIWindowScene, let delegate = windowScene.delegate as? SceneDelegate else {return}

        delegate.window?.rootViewController = welcomeController
        
        userObj.deleteInBackground()
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
