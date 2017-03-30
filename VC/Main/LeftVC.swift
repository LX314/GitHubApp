//
//  LeftVC.swift
//  MyGitHub
//
//  Created by John LXThyme on 2017/3/29.
//  Copyright © 2017年 John LXThyme. All rights reserved.
//

import UIKit

class LeftVC: BaseVC, UITableViewDataSource, UITableViewDelegate {

    lazy var ds = {
        return [
            0 : [
                "Starring Repos",
                 " Users Ranking",
                 "Repositories Ranking",
                 "Discovery",
            ]
        ]
    }()
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = UIColor.white
        // Do any additional setup after loading the view.
        table.delegate = self
        table.dataSource = self
        self.view.addSubview(table)
    }

}
// MARK: - UITableViewDataSource
extension LeftVC {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return ds[section]!.count
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cellIdentifier = "cellIdentifier"
        var cell = tableView.dequeueReusableCell(withIdentifier: cellIdentifier)
        if cell == nil {
            cell = UITableViewCell(style: .default, reuseIdentifier: cellIdentifier)
        }
        let title = ds[indexPath.section]?[indexPath.row]

        cell?.textLabel?.text = title

        return cell!;
    }
}
// MARK: - UITableViewDelegate
extension LeftVC {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        //
        let repoListVC = RepoListVC()
            let nav = self.sideMenuViewController.contentViewController as! UINavigationController
        nav.pushViewController(repoListVC, animated: true)
        self.sideMenuViewController.hideViewController()
    }
}
