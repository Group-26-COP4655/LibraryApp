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
    
    var rating = 0;
    var favorited:Bool = false
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
    }
    
    
//    func isFavorite() -> Bool {
//
//        let tempUserObj = PFUser.current() as! PFUser
//        let favorites = tempUserObj["favorites"] as! [NSDictionary]
//
//        print(favorites)
//
//        for fav in favorites {
//            print(fav["title"])
//        }
//        return false
//    }
    
    
    func setFavorite(_ isFavorited:Bool){
        favorited = isFavorited
        if(favorited){
            favButton.setImage(UIImage(named:"fav_red"), for: UIControl.State.normal)
        }else{
            favButton.setImage(UIImage(named:"fav_white"), for: UIControl.State.normal)
        }
    }
    
    
    
    
    @IBAction func readButton(_ sender: Any) {
        
        
        
        
    }
    
    
    @IBAction func favoriteButton(_ sender: Any) {
        let tempUserObj = PFUser.current()!
        let tempObjID = tempUserObj.objectId!
         
        if(!favorited){
             let query = PFQuery(className:"_User")
             query.getObjectInBackground(withId: tempObjID) { (userFields: PFObject?, error: Error?) in
                 if let error = error {
                    print(error.localizedDescription)
                 } else if let userFields = userFields {
                    var currentFavorites = userFields["favorites"] as! [NSDictionary]
                    currentFavorites.append(self.book)
                    userFields["favorites"] = currentFavorites
                    userFields.saveInBackground()
                    print("Book has successfully been added to favorites!")
                     self.setFavorite(true)
                     self.favorited = true
                }
             }
         }
        else{
             let query = PFQuery(className:"_User")
             query.getObjectInBackground(withId: tempObjID) { (userFields: PFObject?, error: Error?) in
                 if let error = error {
                    print(error.localizedDescription)
                 } else if let userFields = userFields {
                    var currentFavorites = userFields["favorites"] as! [NSDictionary]

                    
                    
                    userFields.saveInBackground()
                     print("Book has successfully been removed from favorites!")
                     self.setFavorite(false)
                     self.favorited = false
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
