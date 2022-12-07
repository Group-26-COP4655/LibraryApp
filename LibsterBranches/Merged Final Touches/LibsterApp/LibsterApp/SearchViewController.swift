//
//  SearchViewController.swift
//  LibsterApp
//
//  Created by Geo on 11/28/22.
//  Copyright © 2022 Geo. All rights reserved.
//

import UIKit
import Alamofire

class SearchViewController: UIViewController, UISearchBarDelegate, UICollectionViewDataSource, UICollectionViewDelegate {

    var searchResponse = NSDictionary()
    var ISBNs:[NSDictionary] = [NSDictionary]([["isbn":"9780973398472"], ["isbn":"9781804541777"], ["isbn":"9780747542988"], ["isbn":"9780735211292"], ["isbn":"9780670813025"], ["isbn":"9781668001226"], ["isbn":"9789022543207"], ["isbn":"9781984827616"], ["isbn":"9780810994553"], ["isbn":"9782012010673"], ["isbn":"9782290019436"], ["isbn":"9788416716340"], ["isbn":"9780370332284"], ["isbn":"9787532766963"], ["isbn":"9780385504201"], ["isbn":"9780439192866"], ["isbn":"9782724215908"], ["isbn":"9788804523154"], ["isbn":"]9780712607940"], ["isbn":"9780590471794"]])

    @IBOutlet weak var searchBar: UISearchBar!
    @IBOutlet weak var searchCollectionView: UICollectionView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        searchCollectionView.delegate = self
        searchCollectionView.dataSource = self
        searchBar.delegate = self
        
        self.searchCollectionView.reloadData()
        
        let layout = searchCollectionView.collectionViewLayout as! UICollectionViewFlowLayout
        
        layout.minimumLineSpacing = 2
        layout.minimumInteritemSpacing = 1
        
        let width = (view.frame.size.width - layout.minimumInteritemSpacing * 2) / 3
        layout.itemSize = CGSize(width: width, height: width * 1.5)

    }
    
    
    func searchBarTextDidBeginEditing(_ searchBar: UISearchBar) {
        self.searchBar.showsCancelButton = true
    }
    
    
    func searchBarCancelButtonClicked(_ searchBar: UISearchBar) {
        searchBar.showsCancelButton = false
        searchBar.text = ""
        searchBar.resignFirstResponder()
        
        let tempISBNArray:[NSDictionary] = [NSDictionary]([["isbn":"9780973398472"], ["isbn":"9781804541777"], ["isbn":"9780747542988"], ["isbn":"9780735211292"], ["isbn":"9780670813025"], ["isbn":"9781668001226"], ["isbn":"9789022543207"], ["isbn":"9781984827616"], ["isbn":"9780810994553"], ["isbn":"9782012010673"], ["isbn":"9782290019436"], ["isbn":"9788416716340"], ["isbn":"9780370332284"], ["isbn":"9787532766963"], ["isbn":"9780385504201"], ["isbn":"9780439192866"], ["isbn":"9782724215908"], ["isbn":"9788804523154"], ["isbn":"]9780712607940"], ["isbn":"9780590471794"]])
        self.ISBNs.removeAll()
        self.ISBNs = tempISBNArray
        self.searchCollectionView.reloadData()
    }
    
    
    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
        let searchText = searchBar.text as! String
        let modifiedSSearchText = searchText.replacingOccurrences(of: " ", with: "+")
        let apiStr = "http://openlibrary.org/search.json?title="
        let apiCallStr = apiStr + modifiedSSearchText

        AF.request(apiCallStr).responseJSON {
            response in
            if (response.value != nil) {
                self.ISBNs.removeAll()
                self.searchResponse = response.value as! NSDictionary

                let tempArray = self.searchResponse["docs"] as! NSArray
                let tempObj = tempArray[0] as! NSDictionary

                for itemObj in tempArray {
                    let tempItemObj = itemObj as! NSDictionary
                    if (tempItemObj != nil && tempItemObj["isbn"] != nil) {
                        let itemArray = tempItemObj["isbn"] as! [String]
                        for isbnItem in itemArray {
                            let itemDict:NSDictionary = ["isbn":isbnItem]
                            self.ISBNs.append(itemDict)
                        }
                    }
                }
                self.searchCollectionView.reloadData()
            }
        }
    }
    
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return self.ISBNs.count
    }

    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = searchCollectionView.dequeueReusableCell(withReuseIdentifier: "SearchGridCell", for: indexPath) as! SearchGridCell
        //                if segue.destination is SearchDetailsViewController {
        //                let searchDetailsViewController = segue.destination as? SearchDetailsViewController
        //                    searchDetailsViewController?.selectedBook = self.selected
        //                }
//                        self.searchCollectionView.reloadData()
//                        print(self.selected)
        //                let searchDetailsViewController = segue.destination as! SearchDetailsViewController
        //                searchDetailsViewController.selectedBook = self.selected
        let coverLink  = "https://covers.openlibrary.org/b/isbn/"
        let coverExtension = "-L.jpg"
        let isbnObj = self.ISBNs[indexPath.item] as NSDictionary
        let isbn = isbnObj["isbn"] as! String
        let fullLink = coverLink + isbn + coverExtension
        let image = URL(string: fullLink)
        cell.bookCover.af.setImage(withURL: image!)

        return cell
    }
    

    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let cell = sender as! UICollectionViewCell
        let indexPath = searchCollectionView.indexPath(for: cell)!
        let selectedISBN = self.ISBNs[indexPath.item]
        let searchDetailsViewController = segue.destination as! SearchDetailsViewController
        searchDetailsViewController.selectedISBN = selectedISBN["isbn"] as! String
    }
}
