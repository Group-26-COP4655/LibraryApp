//
//  OpenedBookmarkViewController.swift
//  LibsterApp
//
//  Created by Geo on 12/4/22.
//  Copyright © 2022 Geo. All rights reserved.
//

import UIKit
import Parse

class OpenedBookmarkViewController: UIViewController {
    
    var openedBookmark:[String:Any] = [String:Any]()
    
    @IBOutlet weak var coverImage: UIImageView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        let coverUrl = openedBookmark["cover"] as! String
        let image = URL(string: coverUrl)
        
        coverImage.af.setImage(withURL: image!)
    }
    
    
    func deleteBookmark(_ tempSessionBookmarks: [NSDictionary]) -> [NSDictionary] {
        if (tempSessionBookmarks != []) {
            let replaceIndex = self.findBook(tempSessionBookmarks)
            let lastIndex = tempSessionBookmarks.count - 1
            var sessionBookmarksMutator = tempSessionBookmarks

            sessionBookmarksMutator[replaceIndex] = sessionBookmarksMutator[lastIndex]
            sessionBookmarksMutator.popLast()
            return sessionBookmarksMutator
        }
        else {
            return []
        }
    }
    
    
    func findBook(_ tempSessionFavorites: [NSDictionary]) -> Int {
        if (tempSessionFavorites != []){
            var index = 0
            let deleteID = self.openedBookmark["bookID"] as! String
            for tempBook in tempSessionFavorites {
                let tempBookID = tempBook["bookID"] as! String

                if (deleteID == tempBookID) {
                    return index
                }
                else {
                    index = index + 1
                }
            }
        }
        return -1
    }
    
    
    @IBAction func removeButton(_ sender: Any) {
        
        let tempUserObj = PFUser.current()!
        let tempObjID = tempUserObj.objectId!
        let query = PFQuery(className:"_User")
        
        query.getObjectInBackground(withId: tempObjID) { (userFields: PFObject?, error: Error?) in
             if let error = error {
                print(error.localizedDescription)
             } else if let userFields = userFields {
                var sessionBookmarks = userFields["bookmarks"] as! [NSDictionary]
                
                sessionBookmarks = self.deleteBookmark(sessionBookmarks)
                userFields["bookmarks"] = sessionBookmarks
                userFields.saveInBackground()
            }
        }
        
        self.dismiss(animated: true, completion: nil)
    }
    

    
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        if segue.destination is ReadBookmarkViewController {
            let readBookmarkViewController = segue.destination as? ReadBookmarkViewController
            readBookmarkViewController?.bookmark = openedBookmark
        }
    }
}
