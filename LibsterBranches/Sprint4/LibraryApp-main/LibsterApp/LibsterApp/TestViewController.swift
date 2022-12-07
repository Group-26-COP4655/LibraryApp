//
//  TestViewController.swift
//  LibsterApp
//
//  Created by Geo on 11/7/22.
//  Copyright © 2022 Geo. All rights reserved.
//

import UIKit
import Parse

class TestViewController: UIViewController {

    
//    var url : String = "https://openlibrary.org/api/books?
//    bibkeys=ISBN:9780980200447&jscmd=details&format=json"
//    var request : NSMutableURLRequest = NSMutableURLRequest()
//    request.URL = NSURL(string: url)
//    request.HTTPMethod = "GET"
//
//    NSURLConnection.sendAsynchronousRequest(request, queue: NSOperationQueue(), completionHandler:{ (response:NSURLResponse!, data: NSData!, error:         NSError!) -> Void in
//    var error: AutoreleasingUnsafeMutablePointer<NSError?> = nil
//    let jsonResult: NSDictionary! = NSJSONSerialization.JSONObjectWithData(data, options:NSJSONReadingOptions.MutableContainers, error: error) as?           NSDictionary
//
//    if (jsonResult != nil) {
//      // process jsonResult
//    } else {
//     // couldn't load JSON, look at error
//    }
//    })
    

//    {
//    bookID: "000000000",
//    title: "A Court of Thorns nd Roses",
//    author: "Sarah J. Maas",
//    cover: "https://covers.openlibrary.org/b/id/10362743-L.jpg",
//    isbn13: "9781619634442",
//    genre: "",
//    }
    
    
    
    
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        testfunc()
        // Do any additional setup after loading the view.
    }
    
    
//    func testParse2() {
//        let
//        User.username = "test_username"
//        User.password = "test_password"
//        User.email = "test_email@test.com"
//        User["userId"] = "A0000"
//        User["profilePicture"] = "url"
//        User["bio"] = "lorem ipsem"
//        User["borrowedBooks"] = []
//        User["bookmarkds"] = []
//        User["favorites"] = []
//        User["friends"] = []
//
//        User.signUpInBackground { (Success, Error) in
//            if (Success) {
//
//            }
//            else {
//                print("Error!")
//                print(Error)
//            }
//        }
        
    
 
  func testfunc() {
     var queryOne = PFUser.query()
      queryOne!.whereKey("username", equalTo:"test_username")
      
      do {
          
       var currentUserObj = try queryOne!.findObjects()
          
      print(currentUserObj)
        
      var currentUser = currentUserObj[0] as! PFObject
        
      print(currentUser["borrowedBooks"] as! [String])
        
      var bio = currentUser["bio"] as! String
        
      var bookmarks = currentUser["bookmarks"] as! [String]
        
      var borrowedBooks = currentUser["borrowedBooks"] as! [String]
        
      var favorites = currentUser["favorites"] as! [String]
        
      var friends = currentUser["friends"] as! [String]
        
      var profilePicture = currentUser["profilePicture"] as! String
        
      var username = currentUser["username"] as! String
        
        
          
      }
      catch {
          
      }
    
    let queryTwo = PFQuery(className:"Popular")
    queryTwo.getObjectInBackground(withId: "8IhEeAImgN") { (popBooksObj, error) in
        if error == nil {
            print(popBooksObj)
            
            var popBooksArr = popBooksObj as! PFObject
            
            print(popBooksArr["Books"] as! [String])
            
        } else {
            // Fail!
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
