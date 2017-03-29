//
//  OAuthVC.swift
//  MyGitHub
//
//  Created by John LXThyme on 2017/3/27.
//  Copyright © 2017年 John LXThyme. All rights reserved.
//

import UIKit

class OAuthVC: UIViewController, UIWebViewDelegate {

    let _authWebview = UIWebView()

    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = "登录"
        initWebview()
        let request = AuthApi.loadAuthCode()
        _authWebview .loadRequest(request)
    }
    func initWebview() {
        _authWebview.frame = self.view.bounds
        _authWebview.delegate = self;
        self.view.addSubview(_authWebview)
    }

    func webViewDidFinishLoad(_ webView: UIWebView) {
        let urlString = webView.request?.url?.absoluteString
        debugPrint("webViewDidFinishLoad")
        let result  = AuthApi.getAuthCode(urlString: urlString!)
        if result.code != "" && result.state == kApiState {
            AuthApi.loadAuthAccessToken(code: result.code, state: result.state)
        } else {
            assert(true, "ERROR")
        }
    }
    func webView(_ webView: UIWebView, didFailLoadWithError error: Error) {
        debugPrint("[Fail]webView:\(webView.request?.url)\r\nerror:\(error)")
    }

}
