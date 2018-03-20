//
//  ViewController.swift
//  sampleapp_webview
//
//  Created by Marco Del Toro on 3/5/18.
//  Copyright © 2018 Marco Del Toro. All rights reserved.
//

import UIKit
import WebKit

class ViewController: UIViewController {

    @IBOutlet weak var webView: WKWebView!
    @IBOutlet weak var urlField: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        let initURL = URL(string: "http://www.ooyala.com")
        let iniReq = URLRequest(url: initURL!)
        webView.load(iniReq)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func loadPage(_ sender: Any) {
        
        let alert = UIAlertController(title: "Invalid URL", message: "Please use a valid URL format", preferredStyle: UIAlertControllerStyle.alert)
         alert.addAction(UIAlertAction(title: "Cancel", style: UIAlertActionStyle.default, handler: nil))
        
        let url = urlField.text as! String
        
        if(verifyUrl(urlString: url)){
            let myURL = URL(string: url)
            let myRequest = URLRequest(url: myURL!)
            webView.load(myRequest)
        } else{
            self.present(alert, animated: true, completion: nil)
        }
    }
    
    
    func verifyUrl(urlString: String?) -> Bool {
        guard let urlString = urlString,
            let url = URL(string: urlString) else {
                return false
        }
        return UIApplication.shared.canOpenURL(url)
    }
    
}

