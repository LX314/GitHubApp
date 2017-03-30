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
    class func toJsonObject(obj : Any)-> NSDictionary {
        if ((obj as AnyObject).count <= 0) {
            return [:]
        }
        var jsonData = obj
        if  (obj as AnyObject).isKind(of: NSString.self) {
           jsonData = (obj as AnyObject).data(using: String.Encoding.utf8.rawValue)!
        }
        do {
            let dict = try JSONSerialization.jsonObject(with: jsonData as! Data, options: JSONSerialization.ReadingOptions.allowFragments)
            return dict as! NSDictionary

        }catch {
            assert(false, error.localizedDescription)
        }
    }
//    + (NSDictionary *)toJsonObject:(id)obj {
//    if (!obj) {
//    return nil;
//    }
//    NSError *error;
//    NSData *jsonData = obj;
//    if ([obj isKindOfClass:[NSString class]]) {
//    jsonData = [obj dataUsingEncoding:NSUTF8StringEncoding];
//    }
//    NSDictionary *dict = [NSJSONSerialization JSONObjectWithData:jsonData options:NSJSONReadingAllowFragments error:&error];
//    return dict;
//    }

}
