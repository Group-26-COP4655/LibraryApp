//
//  BorrowViewController.swift
//  LibsterApp
//
//  Created by Geo on 12/2/22.
//  Copyright © 2022 Geo. All rights reserved.
//

import UIKit
import WebKit
import Parse

class BorrowViewController: UIViewController, WKNavigationDelegate {

    let userObj = PFUser.current()!
    var book = [String:Any]()
    
    @IBOutlet weak var borrowedWebView: WKWebView!
    @IBOutlet weak var buttonText: UIButton!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        let bookUrlStr = book["book"] as! String
        let url = URL(string: bookUrlStr)!
        let request = URLRequest(url: url)

        borrowedWebView.load(request)
        borrowedWebView.navigationDelegate = self
        
        // Do any additional setup after loading the view.
    }
    
    
    func webView(_ webView: WKWebView, decidePolicyFor navigationAction: WKNavigationAction, decisionHandler: @escaping (WKNavigationActionPolicy) -> Void)
    {
        let url:String = webView.url?.absoluteString as! String
        
        if (url.contains("archive")) {
            
            buttonText.setTitle("Save", for: .normal)
        }
        decisionHandler(.allow)
    }
    

    @IBAction func finishButton(_ sender: Any) {

        let currentUrl =  self.borrowedWebView.url?.absoluteString
        
        if (currentUrl != nil) {
            
            let tempUrl:String = currentUrl!
            
            if (tempUrl.contains("archive")) {

                let bookId = book["bookID"] as! String
                
                if (bookId == "N/A") {
                    
                    let query = PFQuery(className:"BookMetadata")

                    query.whereKey("get", equalTo:"allbooks")
                    
                    do {
                        let allBooks:[PFObject] = try query.findObjects()
                        let lastBorrowedBook = allBooks[allBooks.count - 1]
                        let idStr = lastBorrowedBook["bookID"] as! String
                        let latestId = Int(idStr)!
                        let newIdShort = String(latestId + 1)
                        var newIdLong = newIdShort

                        if (idStr.count > newIdShort.count) {
                            
                            let zerosCount = idStr.count - newIdShort.count
                            var idPrefix = ""

                            for _ in 1...zerosCount {
                                idPrefix = idPrefix + "0"
                            }
                            newIdLong = idPrefix + newIdShort
                        }
                        let bookMetadata = PFObject(className:"BookMetadata")
                        bookMetadata["bookID"] = newIdLong
                        bookMetadata["isbn"] = book["isbn"]
                        bookMetadata["rating"] = "0.0"
                        bookMetadata["readers"] = "1"
                        bookMetadata ["raters"] = "0"
                        bookMetadata["rating"] = "0"
                        bookMetadata["get"] = "allbooks"
                        bookMetadata["cumulativeRating"] = "0"
                        bookMetadata.saveInBackground { (succeeded, error)  in
                            if (succeeded) {
                                // The object has been saved.
                            } else {
                                // There was a problem, check error.description
                            }
                        }
                        var tempBorrowedBooks:[[String:Any]] = userObj["borrowedBooks"] as! [[String:Any]]
                        let tempObjID = userObj.objectId!
                        let queryTwo = PFQuery(className:"_User")

                        queryTwo.getObjectInBackground(withId: tempObjID) { (userFields: PFObject?, error: Error?) in
                             if let error = error {
                                print(error.localizedDescription)
                             } else if let userFields = userFields {
                                self.book["bookID"] = newIdLong
                                self.book["readLink"] = tempUrl
                                self.book["readers"] = "1"
                                tempBorrowedBooks.append(self.book)
                                userFields["borrowedBooks"] = tempBorrowedBooks
                                userFields.saveInBackground()
                            }
                        }
                    } catch {
                        print("Error fetching all borrowed books from server")
                        print(error)
                    }
                }
                else {
                    let currentId = book["bookID"] as! String
                    let query = PFQuery(className:"BookMetadata")

                    query.whereKey("bookID", equalTo:currentId)

                    do {
                        let bookResults = try query.findObjects()
                        let tempBook = bookResults[0]
                        let tempBookObjId = tempBook.objectId!
                        let readers = tempBook["readers"] as! String
                        let readersCount = Int(readers)! + 1
                        let query = PFQuery(className:"BookMetadata")
                        
                        query.getObjectInBackground(withId: tempBookObjId) { (updator: PFObject?, error: Error?) in
                            if let error = error {
                                print(error.localizedDescription)
                            } else if let updator = updator {
                                updator["readers"] = String(readersCount)
                                updator.saveInBackground()
                            }
                        }

                        let tempUserObj = PFUser.current()!
                        let tempObjID = tempUserObj.objectId!
                        let queryTwo = PFQuery(className:"_User")

                        queryTwo.getObjectInBackground(withId: tempObjID) { (userFields: PFObject?, error: Error?) in
                             if let error = error {
                                print(error.localizedDescription)
                             } else if let userFields = userFields {
                                var currentBorrowedBooks:[[String:Any]] = userFields["borrowedBooks"] as! [[String : Any]]

                                self.book["readLink"] = tempUrl
                                self.book["readers"] = readersCount
                                currentBorrowedBooks.append(self.book)
                                userFields["borrowedBooks"] = currentBorrowedBooks
                                userFields.saveInBackground()
                            }
                        }
                    } catch {
                        print("Error fetching all borrowed books from server")
                        print(error)
                    }
                }
            }
        }
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
