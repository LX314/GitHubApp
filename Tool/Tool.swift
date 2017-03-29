//
//  Tool.swift
//  MyGitHub
//
//  Created by WM on 2017/3/29.
//  Copyright © 2017年 John LXThyme. All rights reserved.
//

import UIKit

class Tool: NSObject {
    static let manager = Tool()
    private override init() {
        
    }
    
    class func toJsonString(obj : Any)-> String{
        var jsonString : String
        var jsonData : NSData
        if !((obj as AnyObject).isKind(of:NSDictionary.self)) && !((obj as AnyObject).isKind(of: NSArray.self)){
            return "无法解析"
        }
        if (obj as AnyObject).isKind(of: NSData.self) {
            jsonString = NSString.init(data: obj as! Data, encoding: String.Encoding.utf8.rawValue)! as String
            return jsonString
        }
        do {
            jsonData = try JSONSerialization.data(withJSONObject: obj, options: JSONSerialization.WritingOptions.prettyPrinted) as NSData
            jsonString = NSString.init(data: jsonData as Data, encoding: String.Encoding.utf8.rawValue)! as String
            return jsonString
        } catch {
            assert(false, error.localizedDescription)
        }
    }
}
