//
//  UserVC.swift
//  MyGitHub
//
//  Created by WM on 2017/3/29.
//  Copyright © 2017年 John LXThyme. All rights reserved.
//

import UIKit
import SDWebImage

class UserVC: UIViewController {

    @IBOutlet weak var avatarImageView: UIImageView!
    @IBOutlet weak var userButton: UIButton!
    @IBOutlet weak var nameLable: UILabel!
    @IBOutlet weak var mailboxLable: UILabel!
    @IBOutlet weak var blogButton: UIButton!
    @IBOutlet weak var dateLabel: UILabel!
    @IBOutlet weak var responseLabel: UILabel!
    @IBOutlet weak var followingLabel: UILabel!
    @IBOutlet weak var followerLabel: UILabel!
    
    var dataModel : NSDictionary = [:]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationController?.navigationBar.isTranslucent = false
        self.dataFetch()
        self.showUI()
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func dataFetch() {
        LXNetworking.get(path: kApiUserInfo, param: [:]) { (responseObj) in
            print("UserResponseObj:\(Tool.toJsonString(obj: responseObj))")
            self.dataModel = responseObj as! NSDictionary
        }
    }
    func showUI() {
//        self.avatarImageView.sd_setImage(with: se)
    
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
