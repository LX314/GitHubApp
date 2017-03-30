//
//  UserVC.swift
//  MyGitHub
//
//  Created by WM on 2017/3/29.
//  Copyright © 2017年 John LXThyme. All rights reserved.
//

import UIKit
import SDWebImage

class UserVC: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    @IBOutlet weak var avatarImageView: UIImageView!
    @IBOutlet weak var userButton: UIButton!
    @IBOutlet weak var nameLable: UILabel!
    @IBOutlet weak var mailboxLable: UILabel!
    @IBOutlet weak var blogButton: UIButton!
    @IBOutlet weak var dateLabel: UILabel!
    @IBOutlet weak var responseLabel: UILabel!
    @IBOutlet weak var followingLabel: UILabel!
    @IBOutlet weak var followerLabel: UILabel!
    @IBOutlet weak var userTableView: UITableView!
    
    @IBOutlet weak var responseView: UIView!
    @IBOutlet weak var followingView: UIView!
    @IBOutlet weak var followerView: UIView!
    
    var sourceModel = NSDictionary()
    var repoModel = NSArray()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationController?.navigationBar.isTranslucent = false
        self.setUp()
        self.dataFetch()
        // Do any additional setup after loading the view.
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    func setUp() {
        self.userButton.contentHorizontalAlignment = .left
        self.blogButton.contentHorizontalAlignment = .left
        self.responseView.alpha = 1
        self.followingView.alpha = 0
        self.followerView.alpha = 0
        self.userTableView.estimatedRowHeight = 150
        self.userTableView.rowHeight = UITableViewAutomaticDimension;
    }
    func dataFetch() {
        let path = Bundle.main.path(forResource: "User",ofType:"json")
        let data = NSData(contentsOfFile:path!)
        
        let repoPath = Bundle.main.path(forResource: "repoList",ofType:"json")
        let repoData = NSData(contentsOfFile:repoPath!)
    
        do {
            //user message
            let json = try JSONSerialization.jsonObject(with: data! as Data,options:.allowFragments)
            self.sourceModel = json as! NSDictionary
            
            //repo list
            let repoJson = try JSONSerialization.jsonObject(with: repoData! as Data,options:.allowFragments)
            self.repoModel = repoJson as! NSArray
            
            self.showUI()
        }catch {
            
        }
        //        LXNetworking.get(path: kApiUserInfo, param: [:]) { (responseObj) in
        //            print("UserResponseObj:\(Tool.toJsonString(obj: responseObj))")
        //            self.dataModel = responseObj as! NSDictionary
        //        }
    }
    func showUI() {
        self.avatarImageView.sd_setImage(with: NSURL.init(string: self.sourceModel["avatar_url"] as! String)! as URL)
        self.userButton.setTitle(self.sourceModel["login"] as? String, for: UIControlState.normal)
        self.nameLable.text = self.sourceModel["name"] as? String
        self.mailboxLable.text = self.sourceModel["email"] as? String
        self.blogButton.setTitle(self.sourceModel["blog"] as? String, for: .normal)
        self.dateLabel.text = self.sourceModel["created_at"] as? String
        self.responseLabel.text = String(self.sourceModel["public_repos"] as! Int)
        self.followingLabel.text = String(self.sourceModel["following"] as! Int)
        self.followerLabel.text = String(self.sourceModel["followers"] as! Int)
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return repoModel.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cellIdentifier = "cellID"
        var cell = tableView.dequeueReusableCell(withIdentifier: cellIdentifier)
        if cell == nil {
            cell = UserRepoCell(style: .default, reuseIdentifier: cellIdentifier)
        }
        let cell_t = cell as! UserRepoCell
        let item = repoModel[indexPath.row]
        cell_t.resetCell(with: item as! [String : Any], indexPath: indexPath as NSIndexPath)
        return cell!;
    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 100
    }
    
    @IBAction func responseClick(_ sender: Any) {
        self.responseView.alpha = 1
        self.followingView.alpha = 0
        self.followerView.alpha = 0
    }
    
    @IBAction func followingClick(_ sender: Any) {
        self.responseView.alpha = 0
        self.followingView.alpha = 1
        self.followerView.alpha = 0
    }
    
    @IBAction func followerClick(_ sender: Any) {
        self.responseView.alpha = 0
        self.followingView.alpha = 0
        self.followerView.alpha = 1
    }
    
}
