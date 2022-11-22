//
//  BookViewController.swift
//  LibsterApp
//
//  Created by Grant Fairfield on 11/22/22.
//  Copyright © 2022 Geo. All rights reserved.
//

import UIKit
import Parse

class BookViewController: UIViewController {

    var bookObjArr = [PFObject]()
    var selectedBook: PFObject!
    var rating = 0;
    
    @IBOutlet weak var favButton:UIButton!
    @IBOutlet weak var rate1:UIButton!
    @IBOutlet weak var rate2:UIButton!
    @IBOutlet weak var rate3:UIButton!
    @IBOutlet weak var rate4:UIButton!
    @IBOutlet weak var rate5:UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    @IBAction func favoriteButton(_ sender: Any) {
        if(!favorited){
            let query = PFQuery(className:"Accounts")
            query.getObjectInBackground(withId: "xWMyZEGZ") { (account: PFObject?, error: Error?) in
                if let error = error {
                   print(error.localizedDescription)
                } else if let account = account {
                    account["favorites"] = self.bookObjArr
                   account.saveInBackground()
                print("Book has successfully been added to favorites!")
                    self.setFavorite(true)
                    self.favorited = true
               }
            }
        }else{
            let query = PFQuery(className:"Accounts")
            query.getObjectInBackground(withId: "xWMyZEGZ") { (account: PFObject?, error: Error?) in
                if let error = error {
                   print(error.localizedDescription)
                } else if let account = account {
                    account["favorites"] = self.bookObjArr
                   account.saveInBackground()
                    print("Book has successfully been removed from favorites!")
                    self.setFavorite(false)
                    self.favorited = false
               }
            }
        }
        
    }
    
    @IBAction func rate1(_ sender: Any) {
        rating = 1;
        //TODO: set book obj in parse db to rating 1
        print("Given 1 star rating")
    }
    
    @IBAction func rate2(_ sender: Any) {
        rating = 2;
        //TODO: set book obj in parse db to rating 2
        print("Given 2 star rating")
    }
    
    @IBAction func rate3(_ sender: Any) {
        rating = 3;
        //TODO: set book obj in parse db to rating 3
        print("Given 3 star rating")
    }
    
    @IBAction func rate4(_ sender: Any) {
        rating = 4;
        //TODO: set book obj in parse db to rating 4
        print("Given 4 star rating")
    }
    
    @IBAction func rate5(_ sender: Any) {
        rating = 5;
        //TODO: set book obj in parse db to rating 5
        print("Given 5 star rating")
    }
    
    var favorited:Bool = false
        
    func setRating(_ toRate:Int){
        
        if(toRate == 1){
            rate1.setImage(UIImage(named:"rate_gold"), for: UIControl.State.normal)
            rate2.setImage(UIImage(named:"rate_white"), for: UIControl.State.normal)
            rate3.setImage(UIImage(named:"rate_white"), for: UIControl.State.normal)
            rate4.setImage(UIImage(named:"rate_white"), for: UIControl.State.normal)
            rate5.setImage(UIImage(named:"rate_white"), for: UIControl.State.normal)
        }else if(toRate == 2){
            rate1.setImage(UIImage(named:"rate_gold"), for: UIControl.State.normal)
            rate2.setImage(UIImage(named:"rate_gold"), for: UIControl.State.normal)
            rate3.setImage(UIImage(named:"rate_white"), for: UIControl.State.normal)
            rate4.setImage(UIImage(named:"rate_white"), for: UIControl.State.normal)
            rate5.setImage(UIImage(named:"rate_white"), for: UIControl.State.normal)
        }else if(toRate == 3){
            rate1.setImage(UIImage(named:"rate_gold"), for: UIControl.State.normal)
            rate2.setImage(UIImage(named:"rate_gold"), for: UIControl.State.normal)
            rate3.setImage(UIImage(named:"rate_gold"), for: UIControl.State.normal)
            rate4.setImage(UIImage(named:"rate_white"), for: UIControl.State.normal)
            rate5.setImage(UIImage(named:"rate_white"), for: UIControl.State.normal)
        }else if(toRate == 4){
            rate1.setImage(UIImage(named:"rate_gold"), for: UIControl.State.normal)
            rate2.setImage(UIImage(named:"rate_gold"), for: UIControl.State.normal)
            rate3.setImage(UIImage(named:"rate_gold"), for: UIControl.State.normal)
            rate4.setImage(UIImage(named:"rate_gold"), for: UIControl.State.normal)
            rate5.setImage(UIImage(named:"rate_white"), for: UIControl.State.normal)
        }else if(toRate == 5){
            rate1.setImage(UIImage(named:"rate_gold"), for: UIControl.State.normal)
            rate2.setImage(UIImage(named:"rate_gold"), for: UIControl.State.normal)
            rate3.setImage(UIImage(named:"rate_gold"), for: UIControl.State.normal)
            rate4.setImage(UIImage(named:"rate_gold"), for: UIControl.State.normal)
            rate5.setImage(UIImage(named:"rate_gold"), for: UIControl.State.normal)
        }
    }
    
    func setFavorite(_ isFavorited:Bool){
        favorited = isFavorited
        if(favorited){
            favButton.setImage(UIImage(named:"fav_red"), for: UIControl.State.normal)
        }else{
            favButton.setImage(UIImage(named:"fav_white"), for: UIControl.State.normal)
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
