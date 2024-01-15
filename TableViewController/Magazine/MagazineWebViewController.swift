//
//  MagazineWebViewController.swift
//  TableViewController
//
//  Created by 민지은 on 2024/01/15.
//

import UIKit
import WebKit

class MagazineWebViewController: UIViewController {

    @IBOutlet var magazineWebView: WKWebView!
    
    var urlString: String = "url"
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        if let url = URL(string: urlString) {
            
            let request = URLRequest(url: url)
            
            magazineWebView.load(request)
        }
    }

}
