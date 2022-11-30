//
//  SortSelectionViewController.swift
//  LibsterApp
//
//  Created by Darwin Selles on 11/29/22.
//  Copyright © 2022 Geo. All rights reserved.
//

import UIKit

class SortSelectionViewController: UIViewController {
    var ratings = [66, 45.1, 88, 99]
    var popularity = [5,3,4,2,1]
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
    }
    func quicksort<T: Comparable>(arr: inout [T], low: Int, high: Int)
    {
        if(low<high){
            let pi = partition(arr: &arr, low: low, high: high);
            quicksort(arr: &arr, low: low, high: pi-1)
            quicksort(arr: &arr, low: pi+1, high: high)
        }
    }
    
    func partition<T: Comparable>(arr: inout [T], low: Int, high: Int) ->Int
    {
        
        let pivot = arr[high]
        var i = (low-1)
        
        for j in low..<high{
            if(arr[j]<pivot)
            {
                i=i+1;
                swap(arr: &arr, a: i, b: j)
            }
        }
        swap(arr: &arr, a:i+1, b:high)
        return (i+1)
    }
    
    func swap<T>(arr: inout [T], a: Int, b: Int)
    {
        let temp = arr[a]
        arr[a] = arr[b]
        arr[b] = temp
    }

    
    
    @IBAction func sortRatings(_ sender: Any) {
        let low = 0;
        let high = ratings.count-1
        quicksort(arr: &ratings, low: low, high: high)
        printSelection(arr: ratings)
    }
    

    @IBAction func sortPopularity(_ sender: Any) {
        let low = 0;
        let high = popularity.count-1
        quicksort(arr: &popularity, low: low, high: high)
        printSelection(arr: popularity)
    }
    
    func printSelection(arr: [Any])
    {
        print(arr)
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
