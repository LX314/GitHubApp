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
        initWebview()
        getAuthCode()
    }
    func initWebview() {
        _authWebview.frame = self.view.bounds
        _authWebview.delegate = self;
        self.view.addSubview(_authWebview)
    }
    func getAuthCode() {
        var urlString = kApiGetCode;
        urlString = urlString + "?client_id=" + kClientID + "&redirect_uri=" + kCallbackUrl + "&state=" + kApiState + "&allow_signup=true" + "&scope=" + kGitHubScope
        let url = URL(string: urlString)
        let request = URLRequest(url: url!)
        _authWebview .loadRequest(request)
    }
    func getAuthAccessToken(code: String, state: String) {
        let urlString = kApiGetAccessToken
        let param = [
            "client_id": kClientID,
            "client_secret": kClientSecret,
            "code": code,
            "redirect_uri": kCallbackUrl,
            "state": state,
            "allow_signup": "true",
            "scope": kGitHubScope,
            ]
//        LXNetWorking.manager()?.post(urlString, params: param, success: { (dataTask, responseObj) in
//            let jsoObj = responseObj as! [String : String]
//            let access_token = jsoObj["access_token"]
//            UserDefaults.standard.set(access_token, forKey: kGitHubAccessTokenUserDefaultsKey)
//            kGitHubAccessToken = access_token!
//            print("responseObj:\(responseObj)")
//        }, failure: { (dataTask, error) in
//            assert(false, error.localizedDescription)
//        })
    }
    func webViewDidFinishLoad(_ webView: UIWebView) {
        let urlString = webView.request?.url?.absoluteString
        print("")
        let range = urlString?.range(of: "code=")
        if range != nil && !(range?.isEmpty)! {
            var code = ""
            var state = ""
            code = (urlString?.substring(from: (range?.upperBound)!))!
            let index = code.index(code.startIndex, offsetBy: 20)
            code = code.substring(to: index)
            let rangeState = urlString?.range(of: "state=")
            state = (urlString?.substring(from: (rangeState?.upperBound)!))!
            let stateLength = state.index(state.startIndex, offsetBy: kApiState.characters.count)
            state = state.substring(to: stateLength)
            getAuthAccessToken(code: code, state: state)
        }
    }
    func webView(_ webView: UIWebView, didFailLoadWithError error: Error) {
        print("[Fail]webView:\(webView.request?.url)\r\nerror:\(error)")
    }

}
