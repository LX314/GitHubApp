//
//  ViewController.swift
//  MyGitHub
//
//  Created by John LXThyme on 2017/3/27.
//  Copyright © 2017年 John LXThyme. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var btnLogin: UIButton!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.

        print("kGitHubAccessToken:\(kGitHubAccessToken)")
        if kGitHubAccessToken.characters.count == 40 {
            btnLogin.isUserInteractionEnabled = false
            getRepoList()
        }
    }


    @IBAction func btnLogin(_ sender: Any) {
        let authVC = OAuthVC()
        self.showDetailViewController(authVC, sender: self)
    }

    func getRepoList() {
//        let date = Date()
//        let df = DateFormatter()
//        df.dateFormat = "YYYY-MM-DDTHH:MM:SSZ"
//        let dateString = df.string(from: date)
        let params = [
//            "since": dateString,//YYYY-MM-DDTHH:MM:SSZ
//            "since": "2010-03-27",
            "access_token": kGitHubAccessToken,
//            "page": 1,
//            "truncated": true,
//            "scope": kGitHubScope,
        ] as [String : Any]
//        LXNetWorking.manager()?.get(kApiStarredRepoList, params: params, success: { (dataTask, responseObj) in
//            print("responseObj:\(responseObj)")
//            kGitHubStarredRepoList = responseObj as! [[String: Any]]
//            do {
//                let data = try JSONSerialization.data(withJSONObject: kGitHubStarredRepoList, options: JSONSerialization.WritingOptions.prettyPrinted)
//                UserDefaults.standard.set(data, forKey: kGitHubStarredRepoListUserDefaultsKey)
//            } catch {
//                assert(false, error.localizedDescription)
//            }
//        }, failure: { (dataTask, error) in
//            print("error:\(error)")
//        })
    }
}

