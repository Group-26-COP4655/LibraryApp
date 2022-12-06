//
//  ProfileViewController.swift
//  LibsterApp
//
//  Created by Geo on 11/22/22.
//  Copyright © 2022 Geo. All rights reserved.
//

import UIKit
import Parse
import AlamofireImage

class ProfileViewController: UIViewController, UICollectionViewDataSource, UICollectionViewDelegate {

    let userObj = PFUser.current()!
    var favoritedBooks:[[String:Any]] =  [[String:Any]]()
    
    @IBOutlet weak var usernameLabel: UILabel!
    @IBOutlet weak var favoritesCollectionView: UICollectionView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        favoritesCollectionView.delegate = self
        favoritesCollectionView.dataSource = self
        
        let tempObjID = userObj.objectId!
        let query = PFQuery(className:"_User")

        query.getObjectInBackground(withId: tempObjID) { (userFields: PFObject?, error: Error?) in
            if let error = error {
                 print(error.localizedDescription)
            } else if let userFields = userFields {
                
                self.usernameLabel.text = userFields["username"] as? String
            }
        }
        let layout = favoritesCollectionView.collectionViewLayout as! UICollectionViewFlowLayout
        
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
                
                self.favoritedBooks = userFields["favorites"] as! [[String:Any]]
                self.favoritesCollectionView.reloadData()
             }
        }
    }
    
    
    @IBAction func logoutButton(_ sender: Any) {
        
        let main = UIStoryboard(name: "Main", bundle: nil)

        let welcomeController = main.instantiateViewController(withIdentifier: "WelcomeViewController")

        guard let windowScene = UIApplication.shared.connectedScenes.first as? UIWindowScene, let delegate = windowScene.delegate as? SceneDelegate else {return}

        PFUser.logOut()

        delegate.window?.rootViewController = welcomeController
    }
    
    
    @IBAction func deleteButton(_ sender: Any) {
        
    }
    
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        
        return favoritedBooks.count
    }

    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let cell = favoritesCollectionView.dequeueReusableCell(withReuseIdentifier: "FavoritesGridCell", for: indexPath) as! FavoritesGridCell
        let book = favoritedBooks[indexPath.item]
        let coverUrl = book["cover"] as! String
        let image = URL(string: coverUrl)

        cell.coverImage.af.setImage(withURL: image!)
        
        return cell
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
