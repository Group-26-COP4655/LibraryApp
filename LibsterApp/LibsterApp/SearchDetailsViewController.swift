//
//  SearchDetailsViewController.swift
//  LibsterApp
//
//  Created by Geo on 11/30/22.
//  Copyright © 2022 Geo. All rights reserved.
//

import UIKit
import Alamofire
import Parse

class SearchDetailsViewController: UIViewController, UICollectionViewDataSource, UICollectionViewDelegate {
    
    var selectedISBN:String = ""
    var selectedBook:[NSDictionary] = [NSDictionary]()
    
    @IBOutlet weak var searchDetailsCollectionView: UICollectionView!
    

    override func viewDidLoad() {
        super.viewDidLoad()
        
        searchDetailsCollectionView.delegate = self
        searchDetailsCollectionView.dataSource = self
        
        callAPI()
        
        let layout = searchDetailsCollectionView.collectionViewLayout as! UICollectionViewFlowLayout
        
        layout.minimumLineSpacing = 0
        layout.minimumInteritemSpacing = 0
        
        let width = view.frame.size.width
        let height = view.frame.size.height
        layout.itemSize = CGSize(width: width, height: height)
    }
    

    func callAPI() {
        let coverLink  = "https://covers.openlibrary.org/b/isbn/"
        let coverExtension = "-L.jpg"
        let fullLink = coverLink + selectedISBN + coverExtension
        let apiStrPrefix = "https://openlibrary.org/api/books?bibkeys=ISBN:"
        let apiStrSuffix = "&jscmd=details&format=json"
        let apiCallStr = apiStrPrefix + selectedISBN + apiStrSuffix

        AF.request(apiCallStr).responseJSON {
            response in
            if (response.value != nil) {
                let responseObj = response.value as! NSDictionary
                let responseBody = responseObj[responseObj.allKeys[0]] as! NSDictionary
                let responseDetails = responseBody["details"] as! NSDictionary
                var tempObj = [String:Any]()
                
                tempObj = ["bookID":"N/A", "title":"N/A", "author":"N/A, No API Result", "cover":"N/A, No API Result", "isbn":"N/A", "genre":"N/A, No API Result", "summary":"N/A, No API Result", "published":"N/A, No API Result", "rating":"0.0", "readers":"0", "readLink":"N/A, No API Result", "book":"N/A, No API Result", "bookmark":"N/A", "raters":"0", "pages":"N/A, No API Result", "userRating":"0"]
                tempObj["cover"] = fullLink
                tempObj["isbn"] = self.selectedISBN

                if (responseDetails["authors"] != nil) {
                    if let authorArr = responseDetails["authors"] as? [NSDictionary] {
                        let authorObj = authorArr[0]
                        if (authorObj["name"] != nil) {
                            tempObj["author"] = authorObj["name"] as! String
                        }
                    }
                    else {
                        let authorObj = responseDetails["authors"] as! NSDictionary
                        if (authorObj["name"] != nil) {
                            tempObj["author"] = authorObj["name"] as! String
                        }
                    }

                }
                if (responseDetails["description"] != nil) {
                    if let summaryStr = responseDetails["description"] as? String {
                        tempObj["summary"] = summaryStr
                    }
                    else {
                        let summaryObj = responseDetails["description"] as! NSDictionary
                        if (summaryObj["value"] != nil) {
                            tempObj["summary"] = summaryObj["value"] as! String
                        }
                    }
                }
                if (responseDetails["title"] != nil) {
                    tempObj["title"] = responseDetails["title"] as! String
                }
                if (responseDetails["key"] != nil) {
                    let bookPrefix = "https://openlibrary.org"
                    let bookSuffix = responseDetails["key"] as! String
                    tempObj["book"] = bookPrefix + bookSuffix
                }
                if (responseDetails["publish_date"] != nil) {
                    tempObj["published"] = responseDetails["publish_date"] as! String
                }
                if (responseDetails["number_of_pages"] != nil) {
                    tempObj["pages"] = String(responseDetails["number_of_pages"] as! Int)
                }
                
                let query = PFQuery(className:"BookMetadata")

                query.whereKey("isbn", equalTo:self.selectedISBN)
                do {
                    let books:[PFObject] = try query.findObjects()
                    
                    if (books.count != 0) {
                        
                        let book = books[0]
                        
                        tempObj["bookID"] = book["bookID"]
                        tempObj["raters"] = book["raters"]
                        tempObj["rating"] = book["rating"]
                        tempObj["readers"] = book["readers"]
                    }
                    
                    self.selectedBook.append((tempObj as NSDictionary))
                    self.searchDetailsCollectionView.reloadData()
                } catch {
                    print("Error fetching book from server")
                    print(error)
                }
            }
        }
    }
    
    
    
    
    @IBAction func borrowButton(_ sender: Any) {
        
    }
    
    
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
//        print(selectedBook)
        return 1
    }

    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = searchDetailsCollectionView.dequeueReusableCell(withReuseIdentifier: "SearchDetailsGridCell", for: indexPath) as! SearchDetailsGridCell

        if (self.selectedBook.count != 0) {
            let tempBook = self.selectedBook[0]
            let coverLink  = "https://covers.openlibrary.org/b/isbn/"
            let coverExtension = "-L.jpg"
            let isbn = tempBook["isbn"] as! String
            let fullLink = coverLink + isbn + coverExtension
            let image = URL(string: fullLink)
            cell.coverImage.af.setImage(withURL: image!)
            cell.titleLabel.text = tempBook["title"] as? String
            cell.authorLabel.text = tempBook["author"] as? String
            cell.isbnLabel.text = tempBook["isbn"] as? String
            cell.pageCountLabel.text = tempBook["pages"] as? String
            cell.publishedLabel.text = tempBook["published"] as? String
            cell.genreLabel.text = tempBook["genre"] as? String
            cell.summaryLabel.text = tempBook["summary"] as? String
            cell.readersLabel.text = tempBook["readers"] as? String
            cell.raterLabel.text = tempBook["raters"] as? String
            cell.ratingLabel.text = ((tempBook["rating"] as? String)!) + "/5"
        }

        return cell
    }
    
    

    
    
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
         if segue.destination is BorrowViewController {
            if (selectedBook.count != 0) {
                let book = selectedBook[0]
                let borrowViewController = segue.destination as? BorrowViewController
                borrowViewController?.book = book as! [String:Any]
             }
        }
    }
    

}
