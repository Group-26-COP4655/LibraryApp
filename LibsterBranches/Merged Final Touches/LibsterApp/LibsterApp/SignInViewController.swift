//
//  SignInViewController.swift
//  LibsterApp
//
//  Created by Geo on 11/14/22.
//  Copyright © 2022 Geo. All rights reserved.
//

import UIKit
import Parse

class SignInViewController: UIViewController {
    
    
    @IBOutlet weak var usernameField: UITextField!
    @IBOutlet weak var passwordField: UITextField!
    @IBOutlet weak var errorLabel: UILabel!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        passwordField.isSecureTextEntry = true
        // Do any additional setup after loading the view.
    }
    
    
    @IBAction func signinButton(_ sender: Any) {
        
        let username = usernameField.text as! String
        let password = passwordField.text as! String

        
        PFUser.logInWithUsername(inBackground: username, password: password){ (user, error) in
            if user != nil{
                
                self.performSegue(withIdentifier: "logInToDash", sender: nil)
                
            }else{
                let errorDesc = error?.localizedDescription
                
                let errorMessage = errorDesc as! String
                
                self.errorLabel.text = errorMessage
            }
        }
    }
    
    
    @IBAction func cancelButton(_ sender: Any) {
        self.dismiss(animated: true, completion: nil)
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
