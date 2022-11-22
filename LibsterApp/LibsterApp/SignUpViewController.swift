//
//  SignUpViewController.swift
//  LibsterApp
//
//  Created by Geo on 11/14/22.
//  Copyright © 2022 Geo. All rights reserved.
//

import UIKit
import Parse

class SignUpViewController: UIViewController {

    @IBOutlet weak var usernameField: UITextField!
    
    
    @IBOutlet weak var passwordField: UITextField!
    
    
    @IBOutlet weak var verifyPasswordField: UITextField!
    
    
    
    @IBOutlet weak var emailField: UITextField!
    
    
    
    
    @IBOutlet weak var verfiyEmailField: UITextField!
    
    
    @IBOutlet weak var errorLabel: UILabel!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    
    func VerifyPassword()->Bool{
        let passStr = passwordField.text as! String
        
        let verifyPassStr = verifyPasswordField.text as! String
        
        if (passStr == "" || verifyPassStr == ""){
            errorLabel.text = "One or more fields are empty"
            return false
        }
        else if passStr == verifyPassStr{
            errorLabel.text = ""
            return true;
        }
        else{
            errorLabel.text = "Passwords do not match"
            return false;
        }
    }
    
    func VerifyEmail()->Bool{
        let emailStr = emailField.text as! String
        
        let verifyEmailStr = verfiyEmailField.text as! String
        
        if (emailStr == "" || verifyEmailStr == ""){
            errorLabel.text = "One or more fields are empty"
            return false
        }
        else if emailStr == verifyEmailStr{
            errorLabel.text = ""
            return true;
        }
        else{
            errorLabel.text = "Emails do not match"
            return false;
        }
    }
    
    
    
    @IBAction func signupButton(_ sender: Any) {
        if(VerifyPassword() != false && VerifyEmail() != false)
        {
            let usernameStr = usernameField.text as! String
            
            let passwordStr = passwordField.text as! String
            
            let emailStr = emailField.text as! String
            
            let user = PFUser()
            user.username = usernameStr
            user.password = passwordStr
            user.email = emailStr
            user["profilePicture"] = "url"
            user["bio"] = "ipsem lorem"
            user["borrowedBooks"] = [
            [
             "bookID": "000000000",
             "title": "A Court of Thorns nd Roses",
             "author": "Sarah J. Maas",
             "cover": "https://covers.openlibrary.org/b/id/10362743-L.jpg",
             "isbn13": "9781619634442",
             "genre": "Fantasy",
             "summary": "lorem ipsem",
             "published": "May 05, 2015",
             "rating": "5.0",
             "readers": "0",
             "book": "link",
             "bookmark": "n/a"
            ],
            [
             "bookID": "000000001",
             "title": "Treasure Island",
             "author": "Robert Louis Stevenson",
             "cover": "https://covers.openlibrary.org/b/id/12819044-L.jpg",
             "isbn13": "9781784871758",
             "genre": "Fantasy",
             "summary": "lorem ipsem",
             "published": "May 05, 2015",
             "rating": "5.0",
             "readers": "0",
             "book": "link",
             "bookmark": "n/a"
            ],
            [
             "bookID": "000000002",
             "title": "Charlotte's_Web",
             "author": "Sarah J. Maas",
             "cover": "https://covers.openlibrary.org/b/id/8311468-L.jpg",
             "isbn13": "9781619634442",
             "genre": "Fantasy",
             "summary": "lorem ipsem",
             "published": "May 05, 2015",
             "rating": "5.0",
             "readers": "0",
             "book": "link",
             "bookmark": "n/a"
             ],
            [
             "bookID": "000000003",
             "title": "The Lightning Thief",
             "author": "Sarah J. Maas",
             "cover": "https://covers.openlibrary.org/b/id/10164274-L.jpg",
             "isbn13": "9781619634442",
             "genre": "Fantasy",
             "summary": "lorem ipsem",
             "published": "May 05, 2015",
             "rating": "5.0",
             "readers": "0",
             "book": "link",
             "bookmark": "n/a"
             ],
            [
             "bookID": "000000004",
             "title": "Six of Crows",
             "author": "Sarah J. Maas",
             "cover": "https://covers.openlibrary.org/b/id/12667423-L.jpg",
             "isbn13": "9781619634442",
             "genre": "Fantasy",
             "summary": "lorem ipsem",
             "published": "May 05, 2015",
             "rating": "5.0",
             "readers": "0",
             "book": "link",
             "bookmark": "n/a"
             ]]
            user["bookmarks"] = []
            user["favorites"] = []
            user["friends"] = []
            user.signUpInBackground(){(success, error) in
                if success{
                    self.performSegue(withIdentifier: "logInToDash", sender: nil)
                }
                else{
                    let errorDesc = error?.localizedDescription
                    let errorMessage = errorDesc as! String
                    
                    self.errorLabel.text = errorMessage
                }
            }
        }
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
