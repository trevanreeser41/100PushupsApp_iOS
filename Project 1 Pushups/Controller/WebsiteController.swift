//
//  WebsiteController.swift
//  Project 1 Pushups
//
//  Created by Student on 10/1/19.
//  Copyright © 2019 Student. All rights reserved.
//

import UIKit
import WebKit
class WebsiteController: UIViewController, WKUIDelegate {
    
   @IBOutlet var webView: WKWebView!
    
   override func loadView() {
       let webConfiguration = WKWebViewConfiguration()
       webView = WKWebView(frame: .zero, configuration: webConfiguration)
       webView.uiDelegate = self
       view = webView
   }
   override func viewDidLoad() {
       super.viewDidLoad()
       let myURL = URL(string:"https://hundredpushups.com")
       let myRequest = URLRequest(url: myURL!)
       webView.load(myRequest)
   }}
