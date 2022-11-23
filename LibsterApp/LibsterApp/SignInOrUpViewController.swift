//
//  SignInOrUpViewController.swift
//  LibsterApp
//
//  Created by Geo on 11/14/22.
//  Copyright © 2022 Geo. All rights reserved.
//

import UIKit
import Parse

class SignInOrUpViewController: UIViewController {

    
    
    var testBook = [[
      "rating": "5.0",
      "bookID": "000000000",
      "book": "link",
      "author": "Sarah J. Maas",
      "readers": "0",
      "published": "May 05, 2015",
      "isbn13": "9781619634442",
      "title": "A Court of Thorns and Roses",
      "summary": "lorem ipsem",
      "cover": "https://covers.openlibrary.org/b/id/10362743-L.jpg",
      "genre": "Fantasy",
      "bookmark": "n/a"
    ],
    [
      "rating": "5.0",
      "bookID": "000000001",
      "book": "link",
      "author": "Robert Louis Stevenson",
      "published": "May 05, 2015",
      "isbn13": "9781784871758",
      "readers": "0",
      "title": "Treasure Island",
      "summary": "lorem ipsem",
      "cover": "https://covers.openlibrary.org/b/id/12819044-L.jpg",
      "bookmark": "n/a",
      "genre": "Fantasy"
    ],
    [
      "bookID": "000000002",
      "rating": "5.0",
      "book": "link",
      "author": "Sarah J. Maas",
      "published": "May 05, 2015",
      "isbn13": "9781619634442",
      "readers": "0",
      "title": "Charlotte's_Web",
      "summary": "lorem ipsem",
      "cover": "https://covers.openlibrary.org/b/id/8311468-L.jpg",
      "bookmark": "n/a",
      "genre": "Fantasy"
    ],
    [
      "bookID": "000000003",
      "rating": "5.0",
      "book": "link",
      "author": "Sarah J. Maas",
      "published": "May 05, 2015",
      "isbn13": "9781619634442",
      "readers": "0",
      "title": "The Lightning Thief",
      "summary": "lorem ipsem",
      "cover": "https://covers.openlibrary.org/b/id/10164274-L.jpg",
      "bookmark": "n/a",
      "genre": "Fantasy"
    ],
    [
      "rating": "5.0",
      "bookID": "000000004",
      "book": "link",
      "author": "Sarah J. Maas",
      "readers": "0",
      "isbn13": "9781619634442",
      "published": "May 05, 2015",
      "title": "Six of Crows",
      "summary": "lorem ipsem",
      "cover": "https://covers.openlibrary.org/b/id/12667423-L.jpg",
      "bookmark": "n/a",
      "genre": "Fantasy"
    ],
    [
        "rating": "5.0",
        "bookID": "000000005",
        "book": "http://www.archive.org/stream/TheArtOfCommunity",
        "author": "Jono Bacon",
        "readers": "0",
        "isbn13": "0596156715",
        "published": "August 2009",
        "title": "The Art of Community",
        "summary": "lorem ipsem",
        "cover": "https://covers.openlibrary.org/b/id/8619368-L.jpg",
        "bookmark": "n/a",
        "genre": "Educational"
      ]]
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        keepUserLogged()
        // Do any additional setup after loading the view.
        
        

    }
    
    
    override func viewDidAppear(_ animated: Bool) {
//        if UserDefaults.standard.bool(forKey: "userLoggedIn") == true {
//            self.performSegue(withIdentifier: "logInToDash", sender: self)
//        }
    }
    
    
    func keepUserLogged() {
//        UserDefaults.standard.set(true, forKey: "userLoggedIn")
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
