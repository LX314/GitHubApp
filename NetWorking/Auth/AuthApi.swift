//
//  AuthApi.swift
//  MyGitHub
//
//  Created by John LXThyme on 2017/3/28.
//  Copyright © 2017年 John LXThyme. All rights reserved.
//

import UIKit

class AuthApi: NSObject {
    class func loadAuthCode() ->URLRequest {
        var urlString = kApiGetCode + "?client_id=" + kClientID + "&redirect_uri=" + kCallbackUrl + "&state=" + kApiState + "&allow_signup=true" + "&scope=" + kGitHubScope
        let url = URL(string: urlString)
        let request = URLRequest(url: url!)
        return request
    }
    class func getAuthCode(urlString: String) ->(code: String, state: String) {
        let range = urlString.range(of: "code=")
        var code = ""
        var state = ""
        if range != nil && !(range?.isEmpty)! {
            code = urlString.substring(from: (range?.upperBound)!)
            let index = code.index(code.startIndex, offsetBy: 20)
            code = code.substring(to: index)
            let rangeState = urlString.range(of: "state=")
            state = urlString.substring(from: (rangeState?.upperBound)!)
            let stateLength = state.index(state.startIndex, offsetBy: kApiState.characters.count)
            state = state.substring(to: stateLength)
        }
        return (code, state)
    }
    class func loadAuthAccessToken(code: String, state: String) {
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
        let headers = [
            "Content-Type": "application/json;charset=utf-8",
            "Accept-Language": "en;q=1",
            "Accept": "application/json",
            "User-Agent": "MyGitHub/1.0 (iPhone; iOS 10.2; Scale/3.00)",
            "Accept-Encoding": "gzip, deflate",
            ]
        LXNetworking.post(path: urlString, param: param, headers: headers) { (responseObj) in
            let jsoObj = responseObj as! [String : String]
            let access_token = jsoObj["access_token"]
            UserDefaults.standard.set(access_token, forKey: kGitHubAccessTokenUserDefaultsKey)
            kGitHubAccessToken = access_token!
            debugPrint("responseObj:\(responseObj)")
        }
    }
}
