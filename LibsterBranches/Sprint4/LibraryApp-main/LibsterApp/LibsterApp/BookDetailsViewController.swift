//
//  BookDetailsViewController.swift
//  LibsterApp
//
//  Created by Geo on 11/22/22.
//  Copyright © 2022 Geo. All rights reserved.
//

import UIKit
import AlamofireImage
import Parse

class BookDetailsViewController: UIViewController {
    
    var rating = 0
    var book = NSDictionary()
    
    @IBOutlet weak var coverImage: UIImageView!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var authorLabel: UILabel!
    @IBOutlet weak var summaryLabel: UILabel!
    @IBOutlet weak var genreLabel: UILabel!
    @IBOutlet weak var ratingLabel: UILabel!
    @IBOutlet weak var readersLabel: UILabel!
    @IBOutlet weak var favButton: UIButton!
    @IBOutlet weak var rateOneOutlet: UIButton!
    @IBOutlet weak var rateTwoOutlet: UIButton!
    @IBOutlet weak var rateThreeOutlet: UIButton!
    @IBOutlet weak var rateFourOutlet: UIButton!
    @IBOutlet weak var rateFiveOutlet: UIButton!
    
    var readUrl = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
    }
    
//    func loadFavorites() {
//        let tempUserObj = PFUser.current()!
//        let tempObjID = tempUserObj.objectId!
//
//        let query = PFQuery(className:"_User")
//        query.getObjectInBackground(withId: tempObjID) { (userFields: PFObject?, error: Error?) in
//             if let error = error {
//                print(error.localizedDescription)
//             } else if let userFields = userFields {
//                self.sessionFavorites = userFields["favorites"] as! [NSDictionary]
//                let sessionFavorites = userFields["favorites"] as! [NSDictionary]
//
//            }
//        }
//    }
    
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        
        isFavorited()
        
        let coverUrl = book["cover"] as! String
        let image = URL(string: coverUrl)
        let isbn = book["isbn"] as! String
        let query = PFQuery(className:"BookMetadata")

        query.whereKey("isbn", equalTo:isbn)
        do {
            let foundBooks:[PFObject] = try query.findObjects()
            
            if (foundBooks.count != 0) {
                
                let foundBook = foundBooks[0]
                let ratingStr = foundBook["rating"] as! String
                let ratingText = ratingStr + "/5"
                let readersStr = foundBook["readers"] as! String
                let readersText = readersStr + " Readers"
                
                ratingLabel.text = ratingText
                readersLabel.text = readersText
            }
        } catch {
            print("Error fetching book from server")
            print(error)
        }
        
        titleLabel.text = book["title"] as? String
        authorLabel.text = book["author"] as? String
        summaryLabel.text = book["summary"] as? String
        genreLabel.text = book["genre"] as? String
        coverImage.af.setImage(withURL: image!)
        
        let tempUserObjThree = PFUser.current()!
        let tempObjIDThree = tempUserObjThree.objectId!
        let queryThree = PFQuery(className:"_User")
        
        queryThree.getObjectInBackground(withId: tempObjIDThree) { (userFields: PFObject?, error: Error?) in
             if let error = error {
                print(error.localizedDescription)
             } else if let userFields = userFields {
                 let temprBorrowedBooks = userFields["borrowedBooks"] as! [NSDictionary]
                 let temprCurrentBookIndex = self.findBook(temprBorrowedBooks)
                 let temprCurrentBook = temprBorrowedBooks[temprCurrentBookIndex]
                 let userRating = Int(temprCurrentBook["userRating"] as! String)
                 self.setRating(userRating!)
            }
        }
    }
    
    
    func isFavorited() {
        let tempUserObj = PFUser.current()!
        let tempObjID = tempUserObj.objectId!
        let query = PFQuery(className:"_User")

        query.getObjectInBackground(withId: tempObjID) { (userFields: PFObject?, error: Error?) in
             if let error = error {
                print(error.localizedDescription)
             } else if let userFields = userFields {
                var favorited: Bool = false
                let sessionFavorites = userFields["favorites"] as! [NSDictionary]
                let favoriteIndex = self.findBook(sessionFavorites)

                if (favoriteIndex != -1) {
                    favorited = true
                }
                
                self.setFavorite(favorited)
            }
        }
    }
    
    
    func setFavorite(_ isFavorited:Bool){
        if(isFavorited){
            favButton.setImage(UIImage(named:"fav_red"), for: UIControl.State.normal)
        }else{
            favButton.setImage(UIImage(named:"fav_white"), for: UIControl.State.normal)
        }
    }
    
    
    func deleteFavorite(_ tempSessionFavorites: [NSDictionary]) -> [NSDictionary] {
        if (tempSessionFavorites != []) {
            let replaceIndex = self.findBook(tempSessionFavorites)
            let lastIndex = tempSessionFavorites.count - 1
            var sessionFavoritesMutator = tempSessionFavorites

            sessionFavoritesMutator[replaceIndex] = sessionFavoritesMutator[lastIndex]
            sessionFavoritesMutator.popLast()
            return sessionFavoritesMutator
        }
        else {
            return []
        }
    }
    
    
    func findBook(_ tempSessionFavorites: [NSDictionary]) -> Int {
        if (tempSessionFavorites != []){
            var index = 0
            let deleteID = self.book["bookID"] as! String
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
    
    
    @IBAction func readButton(_ sender: Any) {
        
        
        
        
    }
    
    
    @IBAction func favoriteButton(_ sender: Any) {
        let tempUserObj = PFUser.current()!
        let tempObjID = tempUserObj.objectId!
        let query = PFQuery(className:"_User")
        
        query.getObjectInBackground(withId: tempObjID) { (userFields: PFObject?, error: Error?) in
             if let error = error {
                print(error.localizedDescription)
             } else if let userFields = userFields {
                var favorited: Bool = false
                var sessionFavorites = userFields["favorites"] as! [NSDictionary]
                let favoriteIndex = self.findBook(sessionFavorites)
                
                if (favoriteIndex != -1) {
                    favorited = true
                }
                
                if(!favorited) {
                   sessionFavorites.append(self.book)
                   userFields["favorites"] = sessionFavorites
                   userFields.saveInBackground()
//                   print(sessionFavorites)
//                   print("Book has successfully been added to favorites!")
                   self.setFavorite(!favorited)
                }
                else {
                    sessionFavorites = self.deleteFavorite(sessionFavorites)
                    userFields["favorites"] = sessionFavorites
                    userFields.saveInBackground()
//                    print(sessionFavorites)
//                    print("Book has successfully been removed from favorites!")
                    self.setFavorite(!favorited)
                }
            }
        }
    }
    
    
    @IBAction func returnButton(_ sender: Any) {
        
        let tempUserObjFour = PFUser.current()!
        let tempObjIDFour = tempUserObjFour.objectId!
        let queryFour = PFQuery(className:"_User")
        
        queryFour.getObjectInBackground(withId: tempObjIDFour) { (userFields: PFObject?, error: Error?) in
             if let error = error {
                print(error.localizedDescription)
             } else if let userFields = userFields {
                var temprSessionBooks = userFields["borrowedBooks"] as! [NSDictionary]
                
                temprSessionBooks = self.deleteFavorite(temprSessionBooks)
                userFields["borrowedBooks"] = temprSessionBooks
                userFields.saveInBackground()
            }
        }
        
        self.dismiss(animated: true, completion: nil)
    }
    
    
    @IBAction func backButton(_ sender: Any) {
        self.dismiss(animated: true, completion: nil)
    }
    
    
    @IBAction func rateOneAction(_ sender: Any) {
        rating = 1;
        
        setRating(rating)
    }
    
    @IBAction func rateTwoAction(_ sender: Any) {
        rating = 2;
        
        setRating(rating)
    }
    
    @IBAction func rateThreeAction(_ sender: Any) {
        rating = 3;
        
        setRating(rating)
    }
    
    @IBAction func rateFourAction(_ sender: Any) {
        rating = 4;
        
        setRating(rating)
    }
    
    @IBAction func rateFiveAction(_ sender: Any) {
        rating = 5;
        
        setRating(rating)
    }
    
    
    func setRating(_ toRate:Int){
        
        if(toRate == 1){
            rateOneOutlet.setImage(UIImage(named:"rate_gold"), for: UIControl.State.normal)
            rateTwoOutlet.setImage(UIImage(named:"rate_white"), for: UIControl.State.normal)
            rateThreeOutlet.setImage(UIImage(named:"rate_white"), for: UIControl.State.normal)
            rateFourOutlet.setImage(UIImage(named:"rate_white"), for: UIControl.State.normal)
            rateFiveOutlet.setImage(UIImage(named:"rate_white"), for: UIControl.State.normal)
        }else if(toRate == 2){
            rateOneOutlet.setImage(UIImage(named:"rate_gold"), for: UIControl.State.normal)
            rateTwoOutlet.setImage(UIImage(named:"rate_gold"), for: UIControl.State.normal)
            rateThreeOutlet.setImage(UIImage(named:"rate_white"), for: UIControl.State.normal)
            rateFourOutlet.setImage(UIImage(named:"rate_white"), for: UIControl.State.normal)
            rateFiveOutlet.setImage(UIImage(named:"rate_white"), for: UIControl.State.normal)
        }else if(toRate == 3){
            rateOneOutlet.setImage(UIImage(named:"rate_gold"), for: UIControl.State.normal)
            rateTwoOutlet.setImage(UIImage(named:"rate_gold"), for: UIControl.State.normal)
            rateThreeOutlet.setImage(UIImage(named:"rate_gold"), for: UIControl.State.normal)
            rateFourOutlet.setImage(UIImage(named:"rate_white"), for: UIControl.State.normal)
            rateFiveOutlet.setImage(UIImage(named:"rate_white"), for: UIControl.State.normal)
        }else if(toRate == 4){
            rateOneOutlet.setImage(UIImage(named:"rate_gold"), for: UIControl.State.normal)
            rateTwoOutlet.setImage(UIImage(named:"rate_gold"), for: UIControl.State.normal)
            rateThreeOutlet.setImage(UIImage(named:"rate_gold"), for: UIControl.State.normal)
            rateFourOutlet.setImage(UIImage(named:"rate_gold"), for: UIControl.State.normal)
            rateFiveOutlet.setImage(UIImage(named:"rate_white"), for: UIControl.State.normal)
        }else if(toRate == 5){
            rateOneOutlet.setImage(UIImage(named:"rate_gold"), for: UIControl.State.normal)
            rateTwoOutlet.setImage(UIImage(named:"rate_gold"), for: UIControl.State.normal)
            rateThreeOutlet.setImage(UIImage(named:"rate_gold"), for: UIControl.State.normal)
            rateFourOutlet.setImage(UIImage(named:"rate_gold"), for: UIControl.State.normal)
            rateFiveOutlet.setImage(UIImage(named:"rate_gold"), for: UIControl.State.normal)
        }
        
        
        let query = PFQuery(className:"BookMetadata")

        query.whereKey("bookID", equalTo:(book["bookID"] as? String)!)
        do {
            let matchingBooks:[PFObject] = try query.findObjects()
            let matchingBook = matchingBooks[0]
            let tempObjID = matchingBook.objectId!
            let query = PFQuery(className:"BookMetadata")
            
            query.getObjectInBackground(withId: tempObjID) { (userFields: PFObject?, error: Error?) in
                 if let error = error {
                    print(error.localizedDescription)
                 } else if let userFields = userFields {
                    
                    var cumulativeRating:Int = Int(userFields["cumulativeRating"] as! String)!
                    var raters:Int = Int(userFields["raters"] as! String)!
                    var newRating:Double = 0.0

                    cumulativeRating = cumulativeRating + toRate
                    raters = raters + 1
                    newRating = round(Double((cumulativeRating / raters) * 10)) / 10
                    
                    userFields["cumulativeRating"] = String(cumulativeRating)
                    userFields["raters"] = String(raters)
                    userFields["rating"] = String(newRating)
                    userFields.saveInBackground()

                    let ratingText = String(newRating) + "/5"
                    self.ratingLabel.text = ratingText
                    
                    let tempUserObjTwo = PFUser.current()!
                    let tempObjIDTwo = tempUserObjTwo.objectId!
                    let queryTwo = PFQuery(className:"_User")
                    
                    queryTwo.getObjectInBackground(withId: tempObjIDTwo) { (userFields: PFObject?, error: Error?) in
                         if let error = error {
                            print(error.localizedDescription)
                         } else if let userFields = userFields {
                            
                            var bookChangeArray = userFields["borrowedBooks"] as! [[String: Any]]
                            let tempBorrowedArray = userFields["borrowedBooks"] as! [NSDictionary]
                            let tempBookIndex = self.findBook(tempBorrowedArray)
                            
                            bookChangeArray[tempBookIndex]["userRating"] = String(toRate)
                            userFields["borrowedBooks"] = bookChangeArray
                            userFields.saveInBackground()
                        }
                    }
                }
            }
        } catch {
            print("Error rating book")
            print(error)
        }
        
        
        
        
        
        
//        let oldRatingStr = book["rating"] as! String
//        let oldRatingFloat = Float(oldRatingStr)
//        let oldRating = oldRatingFloat as! Float
//
//        var updatedRating =
    }
    
    
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.destination is ReadViewController {
            let readViewController = segue.destination as? ReadViewController
            readViewController?.book = book as! [String:Any]
        }
    }
}
