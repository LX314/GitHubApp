//
//  BaseVC.swift
//  MyGitHub
//
//  Created by John LXThyme on 2017/3/29.
//  Copyright © 2017年 John LXThyme. All rights reserved.
//

import UIKit

class BaseVC: UIViewController {
    lazy var table: UITableView = {
        let table = UITableView(frame: CGRect.zero, style: .grouped)
        table.frame = CGRect(origin: CGPoint(x: 0, y: 44), size: self.view.bounds.size)
        return table
    }()
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        self.automaticallyAdjustsScrollViewInsets = false
        self.view.backgroundColor = UIColor.white
    }

}

