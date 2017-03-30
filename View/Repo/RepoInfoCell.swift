//
//  RepoInfoCell.swift
//  MyGitHub
//
//  Created by John LXThyme on 2017/3/29.
//  Copyright © 2017年 John LXThyme. All rights reserved.
//

import UIKit

class RepoInfoCell: BaseCell {
    lazy var label_name: UILabel = {
        let label = UILabel()
        label.frame = CGRect.zero
        label.textColor = UIColor(fromHexString: "#0366D6")
        label.font = UIFont.boldSystemFont(ofSize: 20)
        return label
    }()
    lazy var label_description: UILabel = {
        let label = UILabel()
        label.frame = CGRect.zero
        label.textColor = UIColor(fromHexString: "#586069")
        label.font = UIFont.systemFont(ofSize: 18)
        label.numberOfLines = 0
        return label
    }()
    lazy var label_latestUpdate: UILabel = {
        let label = UILabel()
        label.frame = CGRect.zero
        label.textColor = UIColor(fromHexString: "#586069")
        label.font = UIFont.systemFont(ofSize: 14)
        return label
    }()
    lazy var btn_language: UIButton = {
        let btn = UIButton(type: .roundedRect)
        btn.setTitleColor(UIColor(fromHexString: "#586069"), for: .normal)
        btn.titleLabel?.font = UIFont.systemFont(ofSize: 14)
        return btn
    }()
    lazy var btn_star: UIButton = {
        let btn = UIButton(type: .roundedRect)
        btn.setTitleColor(UIColor(fromHexString: "#586069"), for: .normal)
        btn.titleLabel?.font = UIFont.systemFont(ofSize: 14)
        return btn
    }()
    lazy var btn_watch: UIButton = {
        let btn = UIButton(type: .roundedRect)
        btn.setTitleColor(UIColor(fromHexString: "#586069"), for: .normal)
        btn.titleLabel?.font = UIFont.systemFont(ofSize: 14)
        return btn
    }()
    lazy var btn_fork: UIButton = {
        let btn = UIButton(type: .roundedRect)
        btn.setTitleColor(UIColor(fromHexString: "#586069"), for: .normal)
        btn.titleLabel?.font = UIFont.systemFont(ofSize: 14)
        return btn
    }()

    lazy var btn_unstar: UIButton = {
        let btn = UIButton(type: .roundedRect)
        btn.setTitleColor(UIColor.black, for: .normal)
        btn.layer.borderWidth = 1
        btn.layer.borderColor = UIColor(fromHexString: "#cccccc").cgColor
        btn.titleLabel?.font = UIFont.systemFont(ofSize: 20)
        return btn
    }()

    override public init(style: UITableViewCellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        initRepoInfoCell()
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
// MARK: - 填充数据
extension RepoInfoCell {
    func resetCell(with item: [String: Any]) {
        let full_name = item["full_name"] as! String
        let description = item["description"] as? String
        let stargazers_count = item["stargazers_count"] as! Int
        let watchers_count = item["watchers_count"] as! Int
        let language = item["language"] as? String
        let forks_count = item["forks_count"] as! Int
        let updated_at = item["updated_at"] as! String

        label_name.text = full_name
        label_description.text = description
        label_latestUpdate.text = updated_at

        btn_language.setTitle(language, for: .normal)

        btn_star.setTitle("\(stargazers_count)", for: .normal)
        btn_watch.setTitle("\(watchers_count)", for: .normal)
        btn_fork.setTitle("\(forks_count)", for: .normal)

        btn_unstar.setTitle("Unstar", for: .normal)
    }
}

// MARK: - 初始化
extension RepoInfoCell {
    func initRepoInfoCell() {
        self.contentView.addSubview(label_name)
        self.contentView.addSubview(label_description)
        self.contentView.addSubview(label_latestUpdate)

        self.contentView.addSubview(btn_language)

        self.contentView.addSubview(btn_star)
        self.contentView.addSubview(btn_watch)
        self.contentView.addSubview(btn_fork)

        self.contentView.addSubview(btn_unstar)

        self.contentView.backgroundColor = UIColor.clear
        self.backgroundColor = UIColor.clear
//        self.contentView.backgroundColor = UIColor(patternImage: UIImage(named: "bg-4.png")!)
    }

    func masonry() {
        self.label_name.snp.makeConstraints { (make) in
            make.top.left.equalToSuperview().offset(8)
        }
        self.label_description.snp.makeConstraints { (make) in
            make.top.equalTo(self.label_name.snp.bottom).offset(20)
            make.left.equalToSuperview().offset(8)
            make.right.equalTo(self.btn_unstar.snp.left).offset(-20)
            make.bottom.equalTo(self.btn_star.snp.top).offset(-20)
        }

        self.btn_language.snp.makeConstraints { (make) in
            make.left.equalToSuperview().offset(8)
            make.bottom.equalToSuperview().offset(-8)
        }

        self.btn_star.snp.makeConstraints { (make) in
            make.left.equalTo(self.btn_language.snp.right).offset(8)
            make.bottom.equalToSuperview().offset(-8)
        }
        self.btn_watch.snp.makeConstraints { (make) in
            make.left.equalTo(self.btn_star.snp.right).offset(8)
            make.bottom.equalToSuperview().offset(-8)
        }
        self.btn_fork.snp.makeConstraints { (make) in
            make.left.equalTo(self.btn_watch.snp.right).offset(8)
            make.bottom.equalToSuperview().offset(-8)
        }


        self.label_latestUpdate.snp.makeConstraints { (make) in
            make.left.equalTo(self.btn_fork.snp.right).offset(20)
            make.bottom.equalToSuperview().offset(-8)
        }

        self.btn_unstar.snp.makeConstraints { (make) in
            make.right.equalToSuperview().offset(-8)
            make.centerY.equalToSuperview()
            make.size.equalTo(CGSize(width: 80, height: 40))
        }
    }
}
