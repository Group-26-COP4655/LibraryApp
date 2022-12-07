//
//  ReadViewController.swift
//  LibsterApp
//
//  Created by Geo on 11/22/22.
//  Copyright © 2022 Geo. All rights reserved.
//

import UIKit
import WebKit
import Parse

class ReadViewController: UIViewController {

    var book:[String:Any] = [String:Any]()
    let userObj = PFUser.current()!
    
    @IBOutlet weak var webView: WKWebView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let bookmarkUrl = book["readLink"] as! String
        let url = URL(string: bookmarkUrl)!
        let request = URLRequest(url: url)
        
        webView.load(request)
    }
    
    
    @IBAction func closeButton(_ sender: Any) {
        self.dismiss(animated: true, completion: nil)
    }
    
    
    func findBook(_ tempSessionFavorites: [[String:Any]]) -> Int {
        if (tempSessionFavorites.count != 0){
            var index = 0
            let findID = self.book["bookID"] as! String
            for tempBook in tempSessionFavorites {
                let tempBookID = tempBook["bookID"] as! String

                if (findID == tempBookID) {
                    return index
                }
                else {
                    index = index + 1
                }
            }
        }
        return -1
    }
    
    
    @IBAction func bookmarkButton(_ sender: Any) {
        
        let tempObjID = userObj.objectId!
        let query = PFQuery(className:"_User")

        query.getObjectInBackground(withId: tempObjID) { (userFields: PFObject?, error: Error?) in
             if let error = error {
                print(error.localizedDescription)
             } else if let userFields = userFields {
                var sessionBookmarks:[[String:Any]] = userFields["bookmarks"] as! [[String:Any]]
                let bookResult:Int = self.findBook(sessionBookmarks)
                
                if (bookResult != -1) {
                    
                    var tempBook = sessionBookmarks[bookResult]
                    
                    tempBook["readLink"] = self.webView.url?.absoluteString
                    
                    sessionBookmarks[bookResult] = tempBook

                    userFields["bookmarks"] = sessionBookmarks
                    userFields.saveInBackground()
                }
                else {
                    self.book["readLink"] = self.webView.url?.absoluteString
                    
                    sessionBookmarks.append(self.book)

                    userFields["bookmarks"] = sessionBookmarks
                    userFields.saveInBackground()
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
