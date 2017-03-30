//
//  RepoApi.swift
//  MyGitHub
//
//  Created by John LXThyme on 2017/3/28.
//  Copyright © 2017年 John LXThyme. All rights reserved.
//

import UIKit
import Mantle

class RepoApi: NSObject {

    class func loadRepoList() {
        let params = [
//            "since": "2010-03-27",
            "access_token": kGitHubAccessToken,
            "page": 1,
            ] as [String : Any]
        LXNetworking.get(path: kApiStarredRepoList, param: params) { (responseObj) in
            debugPrint("responseObj:\(responseObj)")
            kGitHubStarredRepoList = responseObj as! [[String: Any]]
            do {
                let data = try JSONSerialization.data(withJSONObject: kGitHubStarredRepoList, options: JSONSerialization.WritingOptions.prettyPrinted)
                UserDefaults.standard.set(data, forKey: kGitHubStarredRepoListUserDefaultsKey)
            } catch {
                assert(false, error.localizedDescription)
            }
        }
    }
}
