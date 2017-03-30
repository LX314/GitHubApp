//
//  LoginVC.swift
//  MyGitHub
//
//  Created by John LXThyme on 2017/3/30.
//  Copyright © 2017年 John LXThyme. All rights reserved.
//

import UIKit

class LoginVC: BaseVC {
    lazy var imgView_logo: UIImageView = {
        let imgView = UIImageView()
        imgView.image = UIImage(named: "github-logo")
        return imgView
    }()
    lazy var label_title: UILabel = {
        let label = UILabel()
        label.text = "Built for developers"
        label.textColor = UIColor.white
        label.font = UIFont.systemFont(ofSize: 25)
        return label
    }()
    lazy var label_desc: UILabel = {
        let label = UILabel()
        label.numberOfLines = 0
        let desc = "GitHub is a development platform inspired by the way you work. From open source to business, you can host and review code, manage projects, and build software alongside millions of other developers. " as! NSString
        let rangeAll = NSMakeRange(0, desc.length)
        let range1 = desc.range(of: "open source")
        let range2 = desc.range(of: "business")
        var attributedTitle = NSMutableAttributedString(string: desc as String)
        attributedTitle.setAttributes([
                NSForegroundColorAttributeName: UIColor(fromHexString: "#A6A8AA"),
                NSFontAttributeName: UIFont.systemFont(ofSize: 16)
            ], range: rangeAll)
        attributedTitle.setAttributes([
            NSForegroundColorAttributeName: UIColor.white,
            NSFontAttributeName: UIFont.systemFont(ofSize: 18)
            ], range: range1)
        attributedTitle.setAttributes([
            NSForegroundColorAttributeName: UIColor.white,
            NSFontAttributeName: UIFont.systemFont(ofSize: 18)
            ], range: range2)
        label.attributedText = attributedTitle
        return label
    }()

    lazy var tf_username: UITextField = {
        let tf = UITextField()
//        tf.attributedPlaceholder = NSAttributedString(string: "username", attributes:
//        )
        tf.layer.cornerRadius = 10
        return tf
    }()
    lazy var tf_pwd: UITextField = {
        let tf = UITextField()
//        tf.attributedPlaceholder = NSAttributedString(string: "username", attributes:
//        )
        tf.layer.cornerRadius = 10
        return tf
    }()
    lazy var btn_login: UIButton = {
        let btn = UIButton(type: .roundedRect)
        btn.backgroundColor = UIColor(fromHexString: "#2FC050")
        btn.setTitle("登录", for: .normal)
        btn.setTitleColor(UIColor.white, for: .normal)
        return btn
    }()
    lazy var label_policy: UILabel = {
        let label = UILabel()
        label.numberOfLines = 0
        let desc = "By clicking \"Sign up for GitHub\", you agree to our terms of service and privacy policy. We’ll occasionally send you account related emails." as! NSString
        let rangeAll = NSMakeRange(0, desc.length)
        let range1 = desc.range(of: "open source")
        let range2 = desc.range(of: "business")
        var attributedTitle = NSMutableAttributedString(string: desc as! String)
        attributedTitle.setAttributes([
            NSForegroundColorAttributeName: UIColor(fromHexString: "#A6A8AA"),
            NSFontAttributeName: UIFont.systemFont(ofSize: 16)
            ], range: rangeAll)
        attributedTitle.setAttributes([
            NSForegroundColorAttributeName: UIColor.white,
            NSFontAttributeName: UIFont.systemFont(ofSize: 18)
            ], range: range1)
        attributedTitle.setAttributes([
            NSForegroundColorAttributeName: UIColor.white,
            NSFontAttributeName: UIFont.systemFont(ofSize: 18)
            ], range: range2)
        label.attributedText = attributedTitle
        return label
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        resetLoginUI()
        masonry()
    }

}

extension LoginVC {
    func resetLoginUI() {
        self.view.addSubview(imgView_logo)
        self.view.addSubview(label_title)
        self.view.addSubview(label_desc)
        self.view.addSubview(tf_username)
        self.view.addSubview(tf_pwd)
        self.view.addSubview(btn_login)
        self.view.addSubview(label_policy)
    }
    func masonry() {
        imgView_logo.snp.makeConstraints { (make) in
            make.top.equalToSuperview().offset(20)
            make.centerX.equalToSuperview()
            make.size.equalTo(CGSize(width: 100, height: 100))
        }
        label_title.snp.makeConstraints { (make) in
            make.top.equalToSuperview().offset(20)
            make.left.equalToSuperview().offset(8)
            make.right.equalToSuperview().offset(-8)
        }
        label_desc.snp.makeConstraints { (make) in
            make.top.equalToSuperview().offset(20)
            make.left.equalToSuperview().offset(8)
            make.right.equalToSuperview().offset(-8)
        }
        tf_username.snp.makeConstraints { (make) in
            make.top.equalToSuperview().offset(20)
            make.left.equalToSuperview().offset(8)
            make.right.equalToSuperview().offset(-8)
        }
        tf_pwd.snp.makeConstraints { (make) in
            make.top.equalToSuperview().offset(20)
            make.left.equalToSuperview().offset(8)
            make.right.equalToSuperview().offset(-8)
        }
        btn_login.snp.makeConstraints { (make) in
            make.top.equalToSuperview().offset(20)
            make.left.equalToSuperview().offset(8)
            make.right.equalToSuperview().offset(-8)
        }
        label_policy.snp.makeConstraints { (make) in
            make.top.equalToSuperview().offset(8)
            make.left.equalToSuperview().offset(8)
            make.right.equalToSuperview().offset(-8)
        }
    }
}
