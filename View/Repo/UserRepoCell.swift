//
//  UserRepoCell.swift
//  MyGitHub
//
//  Created by WM on 2017/3/30.
//  Copyright © 2017年 John LXThyme. All rights reserved.
//

import UIKit

class UserRepoCell: BaseCell {

    lazy var sequence_lab: UILabel = {
        let label = UILabel()
        label.frame = CGRect.zero
        label.textColor = UIColor.blue
        label.font = UIFont.boldSystemFont(ofSize: 20)
        return label
    }()
    lazy var name_lab: UILabel = {
        let label = UILabel()
        label.frame = CGRect.zero
        label.textColor = UIColor.blue
        label.font = UIFont.boldSystemFont(ofSize: 20)
        return label
    }()
    lazy var star_lab: UILabel = {
        let label = UILabel()
        label.frame = CGRect.zero
        label.textColor = UIColor.blue
        label.font = UIFont.boldSystemFont(ofSize: 20)
        return label
    }()
    lazy var fork_lab: UILabel = {
        let label = UILabel()
        label.frame = CGRect.zero
        label.textColor = UIColor.blue
        label.font = UIFont.boldSystemFont(ofSize: 20)
        return label
    }()
    lazy var language_lab: UILabel = {
        let label = UILabel()
        label.frame = CGRect.zero
        label.textColor = UIColor.blue
        label.font = UIFont.boldSystemFont(ofSize: 20)
        return label
    }()
    lazy var homePage_lab: UILabel = {
        let label = UILabel()
        label.frame = CGRect.zero
        label.textColor = UIColor.blue
        label.font = UIFont.boldSystemFont(ofSize: 20)
        return label
    }()
    lazy var des_lab: UILabel = {
        let label = UILabel()
        label.frame = CGRect.zero
        label.textColor = UIColor.blue
        label.font = UIFont.boldSystemFont(ofSize: 20)
        return label
    }()
    override public init(style: UITableViewCellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        initRepoInfoCell()
        masonry()
    }
    override public init(style: UITableViewCellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        initUserRepoCell()
        masonry()
    }
}
//extension UserRepoCell {
//    initUserRepoCell() {
//    func resetCell(with item: [String: Any]) {
//        let name = item["name"] as! String
//        let description = item["description"] as? String
//        let stargazers_count = item["stargazers_count"] as! Int
//        let fork = item["fork"] as! Bool
//        let language = item["language"] as? String
//        let homePage = item["homepage"] as! Int
//        let updated_at = item["updated_at"] as! String
//        
//        label_name.text = full_name
//        label_description.text = description
//        label_latestUpdate.text = updated_at
//        
//        btn_language.setTitle(language, for: .normal)
//        
//        btn_star.setTitle("\(stargazers_count)", for: .normal)
//        btn_watch.setTitle("\(watchers_count)", for: .normal)
//        btn_fork.setTitle("\(forks_count)", for: .normal)
//        
//        btn_unstar.setTitle("Unstar", for: .normal)
//    }
//}
//
//// MARK: - 初始化
//extension RepoInfoCell {
//    func initRepoInfoCell() {
//        self.contentView.addSubview(label_name)
//        self.contentView.addSubview(label_description)
//        self.contentView.addSubview(label_latestUpdate)
//        
//        self.contentView.addSubview(btn_language)
//        
//        self.contentView.addSubview(btn_star)
//        self.contentView.addSubview(btn_watch)
//        self.contentView.addSubview(btn_fork)
//        
//        self.contentView.addSubview(btn_unstar)
//    }
//    
//    func masonry() {
//        self.label_name.snp.makeConstraints { (make) in
//            make.top.left.equalToSuperview().offset(8)
//        }
//        self.label_description.snp.makeConstraints { (make) in
//            make.top.equalTo(self.label_name.snp.bottom).offset(8)
//            make.left.equalToSuperview().offset(8)
//            make.right.equalTo(self.btn_unstar.snp.left).offset(-20)
//        }
//        
//        self.btn_language.snp.makeConstraints { (make) in
//            make.left.equalToSuperview().offset(8)
//            make.bottom.equalToSuperview().offset(-8)
//        }
//        
//        self.btn_star.snp.makeConstraints { (make) in
//            make.left.equalTo(self.btn_language.snp.right).offset(8)
//            make.bottom.equalToSuperview().offset(-8)
//        }
//        self.btn_watch.snp.makeConstraints { (make) in
//            make.left.equalTo(self.btn_star.snp.right).offset(8)
//            make.bottom.equalToSuperview().offset(-8)
//        }
//        self.btn_fork.snp.makeConstraints { (make) in
//            make.left.equalTo(self.btn_watch.snp.right).offset(8)
//            make.bottom.equalToSuperview().offset(-8)
//        }
//        
//        
//        self.label_latestUpdate.snp.makeConstraints { (make) in
//            make.left.equalTo(self.btn_fork.snp.right).offset(20)
//            make.bottom.equalToSuperview().offset(-8)
//        }
//        
//        self.btn_unstar.snp.makeConstraints { (make) in
//            make.right.equalToSuperview().offset(-8)
//            make.centerY.equalToSuperview()
//        }
//    }
//}

