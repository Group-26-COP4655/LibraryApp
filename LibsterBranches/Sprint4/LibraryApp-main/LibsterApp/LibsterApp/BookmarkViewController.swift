//
//  BookmarkViewController.swift
//  LibsterApp
//
//  Created by Geo on 12/4/22.
//  Copyright © 2022 Geo. All rights reserved.
//

import UIKit
import Parse
import AlamofireImage

class BookmarkViewController: UIViewController, UICollectionViewDataSource, UICollectionViewDelegate {
    
    let userObj = PFUser.current()!
    var bookmarkedBooks:[[String:Any]] = [[String:Any]]()
    
    @IBOutlet weak var bookmarkCollectionView: UICollectionView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        bookmarkCollectionView.delegate = self
        bookmarkCollectionView.dataSource = self
        
        let layout = bookmarkCollectionView.collectionViewLayout as! UICollectionViewFlowLayout
        
        layout.minimumLineSpacing = 40
        layout.minimumInteritemSpacing = 4
        
        let width = (view.frame.size.width - layout.minimumInteritemSpacing * 2) / 3
        layout.itemSize = CGSize(width: width, height: width * 1.5)
    }
    
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        
        let tempObjID = userObj.objectId!
        let query = PFQuery(className:"_User")

        query.getObjectInBackground(withId: tempObjID) { (userFields: PFObject?, error: Error?) in
             if let error = error {
                print(error.localizedDescription)
             } else if let userFields = userFields {
                self.bookmarkedBooks = userFields["bookmarks"] as! [[String:Any]]
                self.bookmarkCollectionView.reloadData()
             }
        }
    }
    
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        
        return bookmarkedBooks.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = bookmarkCollectionView.dequeueReusableCell(withReuseIdentifier: "BookmarkGridCell", for: indexPath) as! BookmarkGridCell
        let bookmarkedBook = bookmarkedBooks[indexPath.item]
        let coverUrl = bookmarkedBook["cover"] as! String
        let image = URL(string: coverUrl)
                
        cell.bookmarkImage.af.setImage(withURL: image!)
        
        return cell
    }
    

    
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        let cell = sender as! UICollectionViewCell
        let indexPath = bookmarkCollectionView.indexPath(for: cell)!
        let bookmarkedBook = bookmarkedBooks[indexPath.item]
        let openedBookmarkViewController = segue.destination as! OpenedBookmarkViewController
        openedBookmarkViewController.openedBookmark = bookmarkedBook
    }
}
