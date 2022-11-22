//
//  DashViewController.swift
//  LibsterApp
//
//  Created by Geo on 11/7/22.
//  Copyright © 2022 Geo. All rights reserved.
//

import UIKit
import Parse
import Alamofire
import AlamofireImage

class DashViewController: UIViewController, UICollectionViewDataSource, UICollectionViewDelegate {
    
    let userObj = PFUser.current()!
    
    var books = [[String: Any]]()
    
    @IBOutlet weak var libCollectionView: UICollectionView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        libCollectionView.delegate = self
        libCollectionView.dataSource = self
        
        self.libCollectionView.reloadData()
        
        let layout = libCollectionView.collectionViewLayout as! UICollectionViewFlowLayout
        
        layout.minimumLineSpacing = 40
        layout.minimumInteritemSpacing = 4
        
        let width = (view.frame.size.width - layout.minimumInteritemSpacing * 2) / 3
        layout.itemSize = CGSize(width: width, height: width * 1.5)
        
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
    
    
    
    
    
//    let url = URL(string: "https://openlibrary.org/api/books?bibkeys=ISBN:9780980200447&jscmd=details&format=json")
//
//    var apiCall = URLRequest(url: url!)
//
//    apiCall.httpMethod = "GET"
//
//    let call = URLSession.shared.dataTask(with: apiCall) { (data, _, error) in
//        guard let data = data, error == nil else  {
//            print(error)
//            return
//        }
//        print("working")
//        print(data.base64EncodedData())
//    }
//
//
//    call.resume()
    
    

//    AF.request("https://openlibrary.org/api/books?bibkeys=ISBN:9780980200447&jscmd=details&format=json").responseJSON {
//        response in print(response)
//    }
    
//  var query = PFUser.query()
//  query!.whereKey("username", equalTo:usernameField.text)
//  do {
//      var queryResult = try (query?.findObjects())
//      var currentUserObj = queryResult! as [PFObject]
//      var currentUser = currentUserObj[0]
//      print(currentUser)
//  } catch {
//      print("User creation failed with error: \(error)")
//  }
    
    
    
    
    
//    var url = "https://openlibrary.org/api/books?bibkeys=ISBN:9781619634442&jscmd=details&format=json"
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
    
    
    
    
        
//    [
//     "bookID": "000000003",
//     "title": "The Lightning Thief",
//     "author": "Sarah J. Maas",
//     "cover": "https://covers.openlibrary.org/b/id/10164274-L.jpg",
//     "isbn13": "9781619634442",
//     "genre": "Fantasy",
//     "summary": "lorem ipsem",
//     "published": "May 05, 2015",
//     "rating": "5.0",
//     "readers": "0",
//     "book": "link",
//     "bookmark": "n/a"
//     ],
//    [
//     "bookID": "000000004",
//     "title": "Six of Crows",
//     "author": "Sarah J. Maas",
//     "cover": "https://covers.openlibrary.org/b/id/12667423-L.jpg",
//     "isbn13": "9781619634442",
//     "genre": "Fantasy",
//     "summary": "lorem ipsem",
//     "published": "May 05, 2015",
//     "rating": "5.0",
//     "readers": "0",
//     "book": "link",
//     "bookmark": "n/a"
//     ]
    
    
    
    
    
//     var queryOne = PFUser.query()
//      queryOne!.whereKey("username", equalTo:"testUserTwo")
      
//      do {
          
//       var currentUserObj = try queryOne!.findObjects()
//
//      print(currentUserObj)
//
//      var currentUser = currentUserObj[0] as! PFObject
//
//      print(currentUser["borrowedBooks"] as! [String])
//
//      var bio = currentUser["bio"] as! String
//
//      var bookmarks = currentUser["bookmarks"] as! [String]
//
//      var borrowedBooks = currentUser["borrowedBooks"] as! [String]
//
//      var favorites = currentUser["favorites"] as! [String]
//
//      var friends = currentUser["friends"] as! [String]
//
//      var profilePicture = currentUser["profilePicture"] as! String
//
//      var username = currentUser["username"] as! String
        
//        userData.text = "no data yet"
          
//      }
//      catch {
//
//      }
    
//    let queryTwo = PFQuery(className:"Popular")
//    queryTwo.getObjectInBackground(withId: "8IhEeAImgN") { (popBooksObj, error) in
//        if error == nil {
//            print(popBooksObj)
//            
//            var popBooksArr = popBooksObj as! PFObject
//            
//            print(popBooksArr["Books"] as! [String])
//            var popular = popBooksArr["Books"] as! [String]
//            
//            
//            
//            
//        } else {
//            // Fail!
//        }
//    }
//      self.Top20.text = "Top20: none yet"
  }

        

    
    
    
    

    
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        if PFUser.current() !== nil{
            let borrowedBooks = userObj["borrowedBooks"] as! [NSDictionary]
            return borrowedBooks.count
        }else{
            return 0
        }
    }

    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = libCollectionView.dequeueReusableCell(withReuseIdentifier: "BookGridCell", for: indexPath) as! BookGridCell
        let borrowedBooks = userObj["borrowedBooks"] as! [NSDictionary]
        print(indexPath.item)
        let book = borrowedBooks[indexPath.item]
        print(book)
        let coverUrl = book["cover"] as! String
        let image = URL(string: coverUrl)
        
        cell.bookView.af.setImage(withURL: image!)
        
        return cell
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
