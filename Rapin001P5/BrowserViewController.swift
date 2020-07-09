//
//  BrowserViewController.swift
//  Rapin001P5
//
//  Created by Rolans Apinis on 7/8/20.
//  Copyright © 2020 Rolans Apinis. All rights reserved.
//

import UIKit
import WebKit

class BrowserViewController: UIViewController, WKUIDelegate, WKNavigationDelegate, UISearchBarDelegate {
    
   // var webView: WKWebView!
    var passedPin: String? = "0000"
    var foundURL: URL?
    var homePage: String = "http://www.apple.com"
    

    @IBOutlet var searchBar: UISearchBar!
    @IBOutlet var printPinToSearchBar: UILabel!
    @IBOutlet var webViewLink: WKWebView!

    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        printPinToSearchBar.text = passedPin
        foundURL = URL(string: homePage)
        searchBar.text = homePage
  /* programatic way of adding view, will use IB
         
        // need to create a confgurator
        let webConfig = WKWebViewConfiguration()
        
        //set up the webView programaticaly
        let safeTop:CGFloat = CGFloat(18.0)
        
        let webRect = CGRect(x: 0, y: safeTop, width: view.frame.width, height: view.frame.height - safeTop)
        webView = WKWebView(frame: webRect, configuration: webConfig)
        
        //set as delegate
        webView.uiDelegate = self
        
        let myURL = URL(string: "https://www.apple.com")
        let myRequest = URLRequest(url: myURL!)
        
        webView.load(myRequest)
        
        
        // Do not forget to add view to root
        view.addSubview(webView)
         
*/
        webViewLink.uiDelegate = self
        webViewLink.navigationDelegate = self
        //creating request for homepage, will be overriden with whatever is found in db
        let myRequest = URLRequest(url: foundURL!)
        webViewLink.load(myRequest)
        
        
        // Do any additional setup after loading the view.
    }
    

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    //MARK: Search Bar Delegate
    // function check weather to allow for the navigation request -> when you press a link in WKWebView
    func webView(_ webView: WKWebView, decidePolicyFor navigationAction: WKNavigationAction, decisionHandler: @escaping (WKNavigationActionPolicy) -> Void) {
        //get the requesting url
        let navigationActionURL = String(describing: navigationAction.request.url!)
        //print for dev
        print(navigationActionURL)
        
        // do not load and update text field if page is a blank
        if (navigationActionURL != "about:blank"){
        searchBar.text = navigationActionURL
    
        decisionHandler(.allow)
            
        }
        else{
            decisionHandler(.cancel)
        }
    }
    
    //MARK: Search Bar Functions
    func searchBarTextDidBeginEditing(_ searchBar: UISearchBar) {
        searchBar.keyboardType = .URL
        searchBar.becomeFirstResponder()
    }
    
    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
        searchBar.resignFirstResponder()
        let page = searchBar.text
        let url = URL(string: page!)
        let request = URLRequest(url: url!)
        
        webViewLink.load(request)
       // let
    }

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
