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
        label.adjustsFontSizeToFitWidth = true
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
        label.textColor = UIColor.gray
        label.font = UIFont.boldSystemFont(ofSize: 12)
        return label
    }()
    lazy var fork_lab: UILabel = {
        let label = UILabel()
        label.frame = CGRect.zero
        label.textColor = UIColor.gray
        label.font = UIFont.boldSystemFont(ofSize: 10)
        return label
    }()
    lazy var language_lab: UILabel = {
        let label = UILabel()
        label.frame = CGRect.zero
        label.textColor = UIColor.gray
        label.font = UIFont.boldSystemFont(ofSize: 10)
        return label
    }()
    lazy var homePage_lab: UILabel = {
        let label = UILabel()
        label.frame = CGRect.zero
        label.textColor = UIColor.blue
        label.font = UIFont.boldSystemFont(ofSize: 10)
        return label
    }()
    lazy var des_lab: UILabel = {
        let label = UILabel()
        label.frame = CGRect.zero
        label.textColor = UIColor.black
        label.font = UIFont.boldSystemFont(ofSize: 12)
        label.numberOfLines = 0
        return label
    }()
    
    override public init(style: UITableViewCellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        initUserRepoCell()
        masonry()
    }
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

}

extension UserRepoCell {
    func resetCell(with item: [String: Any], indexPath:NSIndexPath) {
        let name = item["name"] as! String
        var description = String()
        var language = String()
        var homePage = String()
        if !(item["description"] is NSNull){
            description = item["description"] as! String
        } else {
            description = ""
        }
        let starCount = item["stargazers_count"] as! Int
        let fork = item["fork"] as! Bool
        if !(item["language"] is NSNull) {
            language = item["language"] as! String
        } else {
            language = ""
        }
        
        if !(item["homepage"] is NSNull) {
            homePage = item["homepage"] as! String
        } else {
            homePage = ""
        }
        name_lab.text = name
        des_lab.text = description
        star_lab.text = "Star:\(starCount)"
        if fork == true {
            fork_lab.text = "fork"
        } else {
            fork_lab.text = "owner"
        }
        sequence_lab.text = String(indexPath.row + 1)
        language_lab.text = language
        homePage_lab.text = homePage
    }
}
//// MARK: - 初始化
extension UserRepoCell {
    func initUserRepoCell() {
        self.contentView.addSubview(name_lab)
        self.contentView.addSubview(des_lab)
        self.contentView.addSubview(star_lab)
        
        self.contentView.addSubview(fork_lab)
        
        self.contentView.addSubview(sequence_lab)
        self.contentView.addSubview(language_lab)
        self.contentView.addSubview(homePage_lab)
    }

    func masonry() {
        self.sequence_lab.snp.makeConstraints { (make) in
            make.top.left.equalToSuperview().offset(8)
            make.size.equalTo(CGSize(width: 40, height: 30))
        }
        self.name_lab.snp.makeConstraints { (make) in
            make.top.equalTo(self.sequence_lab.snp.top)
            make.left.equalTo(self.sequence_lab.snp.right).offset(5)
            make.height.equalTo(30)
            make.width.equalTo(200)
        }
//
        self.star_lab.snp.makeConstraints { (make) in
            make.left.equalTo(self.name_lab.snp.right).offset(10)
            make.centerY.equalTo(self.name_lab.snp.centerY)
        }
//
        self.fork_lab.snp.makeConstraints { (make) in
            make.left.equalTo(self.name_lab.snp.left)
            make.top.equalTo(self.name_lab.snp.bottom).offset(5)
            make.size.equalTo(CGSize(width: 40, height: 10))
        }
        self.language_lab.snp.makeConstraints { (make) in
            make.left.equalTo(self.fork_lab.snp.right).offset(5)
            make.top.equalTo(self.fork_lab.snp.top)
            make.width.equalTo(120)
        }
        self.homePage_lab.snp.makeConstraints { (make) in
            make.left.equalTo(self.language_lab.snp.right).offset(20)
            make.right.equalToSuperview().offset(-20)
            make.top.equalTo(self.language_lab.snp.top)
        }
        self.des_lab.snp.makeConstraints { (make) in
            make.top.equalTo(self.fork_lab.snp.bottom).offset(5)
            make.left.equalTo(self.name_lab.snp.left)
            make.right.equalToSuperview().offset(-20)
            make.bottom.equalToSuperview().offset(-5)
        }
    }
}

