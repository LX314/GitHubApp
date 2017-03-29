//
//  MainVC.swift
//  MyGitHub
//
//  Created by John LXThyme on 2017/3/29.
//  Copyright © 2017年 John LXThyme. All rights reserved.
//

import UIKit

class MainVC: UIViewController {

    let authVC = OAuthVC()
    lazy var btnLogin: UIButton = {
        let btn = UIButton(type: .roundedRect)
        btn.setTitle("登录", for: .normal)
        btn.setTitleColor(UIColor.white, for: .normal)
        btn.backgroundColor = UIColor.purple
        btn.center = self.view.center
        btn.bounds = CGRect(origin: CGPoint.zero, size: CGSize(width: 250, height: 60))
        btn.addTarget(nil, action: #selector(self.btnLogin(sender:)), for: .touchUpInside)
        return btn
    }()
    lazy var btnRequest: UIButton = {
        let btn = UIButton(type: .roundedRect)
        btn.setTitle("Request Starring Repo List", for: .normal)
        btn.setTitleColor(UIColor.white, for: .normal)
        btn.backgroundColor = UIColor.purple
        btn.center = CGPoint(x: self.view.center.x, y: self.view.center.y + 100)
        btn.bounds = CGRect(origin: CGPoint.zero, size: CGSize(width: 250, height: 60))
        btn.addTarget(nil, action: #selector(self.btnRequest(sender:)), for: .touchUpInside)
        return btn
    }()
    override func viewDidLoad() {
        super.viewDidLoad()
        //
        initNav()
        self.view.backgroundColor = UIColor.white
        self.view.addSubview(btnLogin)
        self.view.addSubview(btnRequest)
    }
    func initNav() {
        self.navigationItem.leftBarButtonItem = UIBarButtonItem(title: "Left", style: .done, target: self, action: #selector(leftBarButtonItemAction(sender:)))
        self.navigationItem.rightBarButtonItem = UIBarButtonItem(title: "Right", style: .done, target: self, action: #selector(rightBarButtonItemAction(sender:)))
    }
    func leftBarButtonItemAction(sender: Any) {
        self.sideMenuViewController.presentLeftMenuViewController()
    }
    func rightBarButtonItemAction(sender: Any) {
        self.sideMenuViewController.presentRightMenuViewController()
    }
    func navBack(sender: Any) {
        authVC.navigationController?.dismiss(animated: true, completion: nil)
    }
    func btnRequest(sender: Any) {
        RepoApi.loadRepoList()
    }
    func btnLogin(sender: Any) {
        if kGitHubAccessToken.characters.count != 40 {
            loginAction()
        } else {
            let alert = UIAlertController(title: "", message: "已经登录, 是否确定重新登录?", preferredStyle: .alert)
            let okAction = UIAlertAction(title: "OK", style: .destructive, handler: { (action) in
                self.loginAction()
            })
            let cancelAction = UIAlertAction(title: "Cancel", style: .cancel, handler: nil)
            alert.addAction(okAction)
            alert.addAction(cancelAction)
            self.present(alert, animated: true, completion: nil)
        }
    }
    func loginAction() {
        let nav = UINavigationController(rootViewController: authVC)
        authVC.navigationItem.rightBarButtonItem = UIBarButtonItem(title: "完成", style: .done, target: self, action: #selector(navBack(sender:)))
        self.showDetailViewController(nav, sender: self)
    }

    deinit {
        print("---deinit---")
    }
}
