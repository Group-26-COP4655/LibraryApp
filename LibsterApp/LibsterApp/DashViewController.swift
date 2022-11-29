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
        
//        testfunc()
//        
//        sortBooks()

    }
    
    
    func sortBooks() -> [String]{
        let borrowedBooks = userObj["borrowedBooks"] as! [NSDictionary]
        var tempBooks: [String] = []
        
        for tempBook in borrowedBooks {
            tempBooks.append(tempBook["title"] as! String)
        }
        
        var book = tempBooks
            
        var low = 0
        var high = book.count-1
        quicksort(book: &book, low: low, high: high)
        print(book)
        return book
    }
    func quicksort(book: inout [String], low: Int, high: Int)
    {
        if(low<high){
         let pi = partition(book: &book, low: low, high: high);
            quicksort(book: &book, low: low, high: pi-1)
            quicksort(book: &book, low: pi+1, high: high)
        }
    }
    func partition(book: inout [String], low: Int, high: Int) ->Int
    {
        var pivot = book[high]
        var i = (low-1)
        
        for j in low..<high-1{
            if(book[j]<pivot)
            {
                i=i+1;
                swap(book: &book, a: i, b: j)
            }
        }
        swap(book: &book, a:i+1, b:high)
        return (i+1)
    }
    func swap(book: inout [String], a: Int, b: Int)
    {
        let temp = book[a]
        book[a] = book[b]
        book[b] = temp
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
        
    
 
//  func testfunc() {
//    
//    
//        let appMetadata = PFObject(className:"AppMetadata")
//        appMetadata["bookCount"] = 0
//        appMetadata.saveInBackground { (succeeded, error)  in
//            if (succeeded) {
//                // The object has been saved.
//            } else {
//                // There was a problem, check error.description
//            }
//        }
        
        
        
    //    let bookMetadata = PFObject(className:"Book Metadata")
    //    bookMetadata["bookID"] = ["000000000"]
    //    bookMetadata["title"] = ["Six of Crows"]
    //    bookMetadata["author"] = ["Sarah J. Maas"]
    //    bookMetadata["cover"] = ["https://covers.openlibrary.org/b/id/12667423-L.jpg"]
    //    bookMetadata["isbn13"] = ["9781619634442"]
    //    bookMetadata["genre"] = ["Fantasy"]
    //    bookMetadata["summary"] = ["lorem ipsem"]
    //    bookMetadata["published"] = ["May 05, 2015"]
    //    bookMetadata["rating"] = ["5.0"]
    //    bookMetadata["readers"] = ["0"]
    //    bookMetadata["book"] = ["link"]
    //    bookMetadata["bookmark"] = ["n/a"]
    //    bookMetadata ["raters"] = 0
    //    bookMetadata["rating"] = 0
    //    bookMetadata["readers"] = 0
    //    bookMetadata.saveInBackground { (succeeded, error)  in
    //        if (succeeded) {
    //            // The object has been saved.
    //        } else {
    //            // There was a problem, check error.description
    //        }
//        }
    
    
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
  

        

    
    
    

    
    
    
    
//    do{
//    //            var userOBject = try query!.findObjects()
//    //
//    //            print(userOBject[0])
//    //            userOBject[0]["borrowedBooks"] = testBook
//
//
//            let query = PFQuery(className:"_User")
//            query.getObjectInBackground(withId: "nBDUkkNzJE") { (library: PFObject?, error: Error?) in
//                if let error = error {
//                    print(error.localizedDescription)
//                } else if let library = library {
//                    library["borrowedBooks"] = self.testBook
//                    library.saveInBackground()
//                }
//            }
//
//
//            } catch {
//
//        }
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
//    var testBook = [[
//      "rating": "5.0",
//      "bookID": "000000000",
//      "book": "link",
//      "author": "Sarah J. Maas",
//      "readers": "0",
//      "published": "May 05, 2015",
//      "isbn13": "9781619634442",
//      "title": "A Court of Thorns and Roses",
//      "summary": "lorem ipsem",
//      "cover": "https://covers.openlibrary.org/b/id/10362743-L.jpg",
//      "genre": "Fantasy",
//      "bookmark": "n/a"
//    ],
//    [
//      "rating": "5.0",
//      "bookID": "000000001",
//      "book": "link",
//      "author": "Robert Louis Stevenson",
//      "published": "May 05, 2015",
//      "isbn13": "9781784871758",
//      "readers": "0",
//      "title": "Treasure Island",
//      "summary": "lorem ipsem",
//      "cover": "https://covers.openlibrary.org/b/id/12819044-L.jpg",
//      "bookmark": "n/a",
//      "genre": "Fantasy"
//    ],
//    [
//      "bookID": "000000002",
//      "rating": "5.0",
//      "book": "link",
//      "author": "Sarah J. Maas",
//      "published": "May 05, 2015",
//      "isbn13": "9781619634442",
//      "readers": "0",
//      "title": "Charlotte's_Web",
//      "summary": "lorem ipsem",
//      "cover": "https://covers.openlibrary.org/b/id/8311468-L.jpg",
//      "bookmark": "n/a",
//      "genre": "Fantasy"
//    ],
//    [
//      "bookID": "000000003",
//      "rating": "5.0",
//      "book": "link",
//      "author": "Sarah J. Maas",
//      "published": "May 05, 2015",
//      "isbn13": "9781619634442",
//      "readers": "0",
//      "title": "The Lightning Thief",
//      "summary": "lorem ipsem",
//      "cover": "https://covers.openlibrary.org/b/id/10164274-L.jpg",
//      "bookmark": "n/a",
//      "genre": "Fantasy"
//    ],
//    [
//      "rating": "5.0",
//      "bookID": "000000004",
//      "book": "link",
//      "author": "Sarah J. Maas",
//      "readers": "0",
//      "isbn13": "9781619634442",
//      "published": "May 05, 2015",
//      "title": "Six of Crows",
//      "summary": "lorem ipsem",
//      "cover": "https://covers.openlibrary.org/b/id/12667423-L.jpg",
//      "bookmark": "n/a",
//      "genre": "Fantasy"
//    ],
//    [
//        "rating": "5.0",
//        "bookID": "000000005",
//        "book": "http://www.archive.org/stream/TheArtOfCommunity",
//        "author": "Jono Bacon",
//        "readers": "0",
//        "isbn13": "0596156715",
//        "published": "August 2009",
//        "title": "The Art of Community",
//        "summary": "lorem ipsem",
//        "cover": "https://covers.openlibrary.org/b/id/8619368-L.jpg",
//        "bookmark": "n/a",
//        "genre": "Educational"
//      ]]
    
    
    
    
    
    
    
    
    
    
    
    

    
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        let borrowedBooks = userObj["borrowedBooks"] as! [NSDictionary]
        
        return borrowedBooks.count
    }

    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = libCollectionView.dequeueReusableCell(withReuseIdentifier: "BookGridCell", for: indexPath) as! BookGridCell
        let borrowedBooks = userObj["borrowedBooks"] as! [NSDictionary]
//        let borrowedBooks = sortBooks()
        let book = borrowedBooks[indexPath.item]
        let coverUrl = book["cover"] as! String
        let image = URL(string: coverUrl)
        
        cell.bookView.af.setImage(withURL: image!)
        
        return cell
    }
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    


    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let cell = sender as! UICollectionViewCell
        let indexPath = libCollectionView.indexPath(for: cell)!
        let borrowedBooks = userObj["borrowedBooks"] as! [NSDictionary]
        let book = borrowedBooks[indexPath.item]
        let detailsViewController = segue.destination as! BookDetailsViewController
        detailsViewController.book = book
    }



}
