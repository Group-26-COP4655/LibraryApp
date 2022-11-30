//
//  BookmarksViewController.swift
//  LibsterApp
//
//  Created by Grant Fairfield on 11/29/22.
//  Copyright © 2022 Geo. All rights reserved.
//

import UIKit
import Parse
import Alamofire
import AlamofireImage

class BookmarksViewController: UIViewController, UICollectionViewDataSource, UICollectionViewDelegate {

    let userObj = PFUser.current()!
    
    var books = [[String: Any]]()
    
    @IBOutlet weak var BMCollectionView: UICollectionView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        BMCollectionView.delegate = self
        BMCollectionView.dataSource = self
        
        self.BMCollectionView.reloadData()
        
        let layout = BMCollectionView.collectionViewLayout as! UICollectionViewFlowLayout
        
        layout.minimumLineSpacing = 40
        layout.minimumInteritemSpacing = 4
        
        let width = (view.frame.size.width - layout.minimumInteritemSpacing * 2) / 3
        layout.itemSize = CGSize(width: width, height: width * 1.5)

    }
    
    
    func sortBooks() -> [String]{
        let bookmarks = userObj["bookmarks"] as! [NSDictionary]
        var tempBooks: [String] = []
        
        for tempBook in bookmarks {
            tempBooks.append(tempBook["title"] as! String)
        }
        
        var book = tempBooks
            
        let low = 0
        let high = book.count-1
        quicksort(book: &book, low: low, high: high)
        print(book)
        return book
    }
    func quicksort(book: inout [String], low: Int, high: Int)
    {
        if(low<high){
         let pi = partition(book: &book, low: low, high: high);
            quicksort(book: &book, low: low, high: pi-1)
            quicksort(book: &book, low: pi+1, high: high)
        }
    }
    func partition(book: inout [String], low: Int, high: Int) ->Int
    {
        let pivot = book[high]
        var i = (low-1)
        
        for j in low..<high-1{
            if(book[j]<pivot)
            {
                i=i+1;
                swap(book: &book, a: i, b: j)
            }
        }
        swap(book: &book, a:i+1, b:high)
        return (i+1)
    }
    func swap(book: inout [String], a: Int, b: Int)
    {
        let temp = book[a]
        book[a] = book[b]
        book[b] = temp
    }

    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        let bookmarks = userObj["bookmarks"] as! [NSDictionary]
        
        return bookmarks.count
    }

    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = BMCollectionView.dequeueReusableCell(withReuseIdentifier: "BMBookCell", for: indexPath) as! BMBookCell
        let bookmarks = userObj["bookmarks"] as! [NSDictionary]
        let book = bookmarks[indexPath.item]
        let coverUrl = book["cover"] as! String
        let image = URL(string: coverUrl)
        
        cell.BMBookView.af.setImage(withURL: image!)
        
        return cell
    }
    
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let cell = sender as! UICollectionViewCell
        let indexPath = BMCollectionView.indexPath(for: cell)!
        let bookmarks = userObj["bookmarks"] as! [NSDictionary]
        let book = bookmarks[indexPath.item]
        let detailsViewController = segue.destination as! BookDetailsViewController
        detailsViewController.book = book
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
