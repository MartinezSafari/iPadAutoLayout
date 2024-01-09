//
//  ViewController.swift
//  iPadAutoLayout
//
//  Created by Martinez on 2024/01/09.
//

import UIKit
import WebKit

class ViewController: UIViewController, WKNavigationDelegate {
    
    @IBOutlet var webView : WKWebView!
    @IBOutlet var activity : UIActivityIndicatorView!
    
    @IBOutlet var tfName : UITextField!
    @IBOutlet var tfEmail : UITextField!
    
    @IBOutlet var lbName : UILabel!
    @IBOutlet var lbEmail : UILabel!
    
    func webView(_ webView: WKWebView, didStartProvisionalNavigation navigation: WKNavigation!) {
        activity.isHidden = false
        activity.startAnimating()
    }
    func webView(_ webView: WKWebView, didFinish navigation: WKNavigation!) {
        activity.isHidden = true
        activity.stopAnimating()
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        //Connect to my GitHub repository
        let urlAddress = URL(string: "https://www.nintendo.com/us/store/games/")
        let url = URLRequest(url: urlAddress!)
        webView.load(url)
        webView.navigationDelegate = self
        
    }


}

