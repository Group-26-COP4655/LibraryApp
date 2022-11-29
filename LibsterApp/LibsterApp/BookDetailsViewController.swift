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
        
        isFavorited()
        
        let ratingStr = book["rating"] as? String
        let ratingText = ratingStr! + "/5"
        let readersStr = book["readers"] as? String
        let readersText = readersStr! + " Readers"
        let coverUrl = book["cover"] as! String
        let image = URL(string: coverUrl)
        
        titleLabel.text = book["title"] as? String
        authorLabel.text = book["author"] as? String
        summaryLabel.text = book["summary"] as? String
        genreLabel.text = book["genre"] as? String
        ratingLabel.text = ratingText
        readersLabel.text = readersText
        coverImage.af.setImage(withURL: image!)
        
        
//        print("value of favorited inside of viewDidLoad")
//        print(self.favorited)
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
                   print(sessionFavorites)
                   print("Book has successfully been added to favorites!")
                   self.setFavorite(!favorited)
                }
                else {
                    sessionFavorites = self.deleteFavorite(sessionFavorites)
                    userFields["favorites"] = sessionFavorites
                    userFields.saveInBackground()
                    print(sessionFavorites)
                    print("Book has successfully been removed from favorites!")
                    self.setFavorite(!favorited)
                }
            }
        }
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
        
        
//        let oldRatingStr = book["rating"] as! String
//        let oldRatingFloat = Float(oldRatingStr)
//        let oldRating = oldRatingFloat as! Float
//        
//        var updatedRating = 
        
        let ratingText = String(toRate) + ".0/5"
        ratingLabel.text = ratingText
    }
    
    
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.destination is ReadViewController {
        let readViewController = segue.destination as? ReadViewController
            readViewController?.readUrl = book["book"] as! String
        }
    }

}
