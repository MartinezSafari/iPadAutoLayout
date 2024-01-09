//
//  ViewController.swift
//  iPadAutoLayout
//
//  Created by Martinez on 2024/01/09.
//

import UIKit
import WebKit

class ViewController: UIViewController, WKNavigationDelegate, UITextFieldDelegate {
    
    @IBOutlet var webView : WKWebView!
    @IBOutlet var activity : UIActivityIndicatorView!
    
    @IBOutlet var tfName : UITextField!
    @IBOutlet var tfEmail : UITextField!
    
    @IBOutlet var lbName : UILabel!
    @IBOutlet var lbEmail : UILabel!
    
    func doTheUpdate(){
        let data : Data = .init()
        data.initWithStuff(theName: tfName.text!, theEmail: tfEmail.text!)
        
        lbName.text = data.savedName
        lbEmail.text = data.savedEmail
    }
    
    @IBAction func updateLabels (sender : Any){
        let alert = UIAlertController(title: "Warning", message: "Are you sure", preferredStyle: .alert)
        
        let yesAction = UIAlertAction(title: "Yes", style: .default, handler:
                                        {
            (alert : UIAlertAction!) in self.doTheUpdate()
            self.dismiss(animated: true, completion: nil)
        })
        
        let noAction = UIAlertAction(title: "No", style: .cancel, handler: nil)
        
        alert.addAction(yesAction)
        alert.addAction(noAction)
        
        present(alert, animated: true)
    }
    
    //Function to remove the keyboard
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        return textField.resignFirstResponder()
    }
    
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

