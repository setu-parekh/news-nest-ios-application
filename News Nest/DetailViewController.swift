//
//  DetailViewController.swift
//  News Nest
//
//  Created by Neel B Gandhi on 11/25/20.
//  Copyright © 2020 Setu Parekh. All rights reserved.
//

import UIKit
import WebKit

class DetailViewController: UIViewController {

    @IBOutlet weak var detailedWebView: WKWebView!
    @IBOutlet weak var spinner: UIActivityIndicatorView!
    
    var articleUrl:String?
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Set the DetailedWebView as delegate for WKNavigationDelegate
        detailedWebView.configuration.mediaTypesRequiringUserActionForPlayback = .all
        detailedWebView.configuration.allowsInlineMediaPlayback = false
        detailedWebView.navigationDelegate = self
    }
    
    override func viewWillAppear(_ animated: Bool) {
        // Check that there is a valid articleURL
        if articleUrl != nil {
            // Create URL object
            let url = URL(string: articleUrl!)
            
            guard url != nil else {
                print("Could not create the detail article URL object.")
                return
            }
            
            // Create the URLRequest Object
            let request = URLRequest(url: url!)
            
            // Start the spinner
            spinner.alpha = 1
            spinner.startAnimating()
            
            // Load articleURL in web view
            detailedWebView.configuration.mediaTypesRequiringUserActionForPlayback = .all
            detailedWebView.configuration.allowsInlineMediaPlayback = false
            detailedWebView.load(request)
        }
    }
}

extension DetailViewController: WKNavigationDelegate {
    
    func webView(_ webView: WKWebView, didFinish navigation: WKNavigation!) {
        // Stop the spinner
        spinner.stopAnimating()
        
        // Hide the spinner
        spinner.alpha = 0
    }
    
}
