//
//  ReadViewController.swift
//  LibsterApp
//
//  Created by Geo on 11/22/22.
//  Copyright © 2022 Geo. All rights reserved.
//

import UIKit
import Parse
import WebKit

class ReadViewController: UIViewController {

    
    
    var readUrl: String = ""
    
    
    
    @IBOutlet weak var webView: WKWebView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let url = URL(string: readUrl)!
        let request = URLRequest(url: url)
        
        webView.load(request)
        
        // Do any additional setup after loading the view.
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
