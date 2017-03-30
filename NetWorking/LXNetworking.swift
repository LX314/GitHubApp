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
        var manager: SessionManager? = nil
        let config: URLSessionConfiguration = URLSessionConfiguration.default

        config.timeoutIntervalForRequest = 15;
        manager = SessionManager(configuration: config)
//        manager?.request(<#T##url: URLConvertible##URLConvertible#>)
    }
    class func get(path: String, param: [String: Any], completion: @escaping(Any) ->Void) {
        self.request(method: .get, path: path, param: param, completion: completion)
    }

    class func post(path: String, param: [String: Any], completion: @escaping(Any) ->Void) {
        self.request(method: .post, path: path, param: param, completion: completion)
    }
    class func post(path: String, param: [String: Any], headers: [String: String], completion: @escaping(Any) ->Void) {
        self.request(method: .post, path: path, param: param, headers: headers, completion: completion)
    }
/**
     "Access-Control-Allow-Origin" = "*";
     "Access-Control-Expose-Headers" = "ETag, Link, X-GitHub-OTP, X-RateLimit-Limit, X-RateLimit-Remaining, X-RateLimit-Reset, X-OAuth-Scopes, X-Accepted-OAuth-Scopes, X-Poll-Interval";
     "Cache-Control" = "private, max-age=60, s-maxage=60";
     "Content-Encoding" = gzip;
     "Content-Security-Policy" = "default-src 'none'";
     "Content-Type" = "application/json; charset=utf-8";
     Date = "Tue, 28 Mar 2017 13:42:50 GMT";
     Etag = "W/\"9bf54ce26b66a6e449bd39a6cdafe32d\"";
     Link = "<https://api.github.com/user/starred?access_token=a0e54de5f998ef030252ba39ef9e394d91d51958&page=2>; rel=\"next\", <https://api.github.com/user/starred?access_token=a0e54de5f998ef030252ba39ef9e394d91d51958&page=29>; rel=\"last\"";
     Server = "GitHub.com";
     Status = "200 OK";
     "Strict-Transport-Security" = "max-age=31536000; includeSubdomains; preload";
     "Transfer-Encoding" = Identity;
     Vary = "Accept, Authorization, Cookie, X-GitHub-OTP, Accept-Encoding";
     "X-Accepted-OAuth-Scopes" = "";
     "X-Content-Type-Options" = nosniff;
     "X-Frame-Options" = deny;
     "X-GitHub-Media-Type" = "github.v3; format=json";
     "X-GitHub-Request-Id" = "937E:1046C:673FFF:812E94:58DA6858";
     "X-OAuth-Client-Id" = 86c2568b2f7c6400fa0c;
     "X-OAuth-Scopes" = "gist, repo, user";
     "X-RateLimit-Limit" = 5000;
     "X-RateLimit-Remaining" = 4999;
     "X-RateLimit-Reset" = 1490712170;
     "X-Served-By" = 7efb7ae49588ef0269c6a1c1bd3721d9;
     "X-XSS-Protection" = "1; mode=block";
 */
    class func request(method: HTTPMethod, path: String, param: [String: Any], completion: @escaping(Any) ->Void) {
        Alamofire.request(path, method: method, parameters: param)
            .responseJSON { (response) in
                debugPrint("result:\(response.result)")
                switch response.result {
                case .success:
                    let jsonObj = response.result.value!
                    completion(jsonObj)
                case .failure(let error):
                    judgeErrorType(response: response)
                    assert(true, "ERROR:\(error)")
                }
        }
    }
    class func request(method: HTTPMethod, path: String, param: [String: Any], headers: [String: String], completion: @escaping(Any) ->Void) {
        Alamofire.request(path, method: method, parameters: param, encoding: JSONEncoding.prettyPrinted, headers: headers)
            .responseJSON { (response) in
                debugPrint("result:\(response.result)")
                switch response.result {
                case .success:
                    let jsonObj = response.result.value!
                    completion(jsonObj)
                case .failure(let error):
                    judgeErrorType(response: response)
                    assert(true, "ERROR:\(error)")
                }
        }
    }
    class func judgeErrorType(response: DataResponse<Any>) {
        guard case let .failure(error) = response.result else { return }

        if let error = error as? AFError {
            switch error {
            case .invalidURL(let url):
                print("Invalid URL: \(url) - \(error.localizedDescription)")
            case .parameterEncodingFailed(let reason):
                print("Parameter encoding failed: \(error.localizedDescription)")
                print("Failure Reason: \(reason)")
            case .multipartEncodingFailed(let reason):
                print("Multipart encoding failed: \(error.localizedDescription)")
                print("Failure Reason: \(reason)")
            case .responseValidationFailed(let reason):
                print("Response validation failed: \(error.localizedDescription)")
                print("Failure Reason: \(reason)")

                switch reason {
                case .dataFileNil, .dataFileReadFailed:
                    print("Downloaded file could not be read")
                case .missingContentType(let acceptableContentTypes):
                    print("Content Type Missing: \(acceptableContentTypes)")
                case .unacceptableContentType(let acceptableContentTypes, let responseContentType):
                    print("Response content type: \(responseContentType) was unacceptable: \(acceptableContentTypes)")
                case .unacceptableStatusCode(let code):
                    print("Response status code was unacceptable: \(code)")
                }
            case .responseSerializationFailed(let reason):
                print("Response serialization failed: \(error.localizedDescription)")
                print("Failure Reason: \(reason)")
            }

            print("Underlying error: \(error.underlyingError)")
        } else if let error = error as? URLError {
            print("URLError occurred: \(error)")
        } else {
            print("Unknown error: \(error)")
        }
    }
}
