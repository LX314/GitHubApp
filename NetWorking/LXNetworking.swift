//
//  LXNetworking.swift
//  MyGitHub
//
//  Created by John LXThyme on 2017/3/28.
//  Copyright © 2017年 John LXThyme. All rights reserved.
//

import UIKit
import Alamofire

class LXNetworking: NSObject {

    func initNetworking() {
//        var manager: SessionManager? = nil
//        let config: URLSessionConfiguration = URLSessionConfiguration.default
//
//        config.timeoutIntervalForRequest = 15;
//        manager = SessionManager(configuration: config)
//        manager?.request(<#T##url: URLConvertible##URLConvertible#>)
    }
    open func get(path: String, param: [String: Any], completion: @escaping([String: Any]) ->Void) {
        let headers = [String: String]()
        Alamofire.request(path, method: .post, parameters: param, encoding: URLEncoding.default, headers: headers).responseJSON { (response) in
            print(response.result)
            switch response.result {
            case .success:
                let jsonObj = response.result.value
                 completion(jsonObj as! [String : Any])
            case .failure(let error):
                assert(false, "ERROR:\(error)")
            }
        }
    }

    open func post(path: String, param: [String: Any]) {

    }
}
