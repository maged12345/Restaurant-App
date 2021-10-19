//
//  WebViewViewController.swift
//  Restaurant App
//
//  Created by majid mohmed on 19/10/2021.
//  Copyright © 2021 majid mohmed. All rights reserved.
//

import UIKit
import WebKit
class WebViewViewController: UIViewController {
    var linkPassed = ""

    @IBOutlet weak var webView: WKWebView!
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationItem.largeTitleDisplayMode = .never
        if let url = URL(string: linkPassed) {
            let request = URLRequest(url: url)
            webView.load(request)
        }
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
