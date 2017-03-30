//
//  RepoListVC.swift
//  MyGitHub
//
//  Created by John LXThyme on 2017/3/28.
//  Copyright © 2017年 John LXThyme. All rights reserved.
//

import UIKit
import SnapKit
class RepoListVC: BaseVC, UITableViewDelegate, UITableViewDataSource {
    lazy var ds: [[String: Any]] = {
        let data = UserDefaults.standard.value(forKey: kGitHubStarredRepoListUserDefaultsKey)
        if data == nil {
            return []
        }

        var jsonObj = [[String: Any]]()
        do {
            jsonObj = try JSONSerialization.jsonObject(with: data as! Data, options: JSONSerialization.ReadingOptions.allowFragments) as! [[String: Any]]
        } catch {
            assert(true, "ERROR")
        }
        return jsonObj as! [[String: Any]]
    }()
    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationController?.navigationBar.setBackgroundImage(UIImage(named: "bg-9.png"), for: .default)
        //        self.navigationController?.navigationBar.shadowImage = UIImage()
        //        self.view.backgroundColor = UIColor.clear
        self.view.backgroundColor = UIColor(patternImage: UIImage(named: "bg-9.png")!)
        resetTableView()
        self.view.addSubview(table)
        masonry()
    }

}

// MARK: - UITableViewDataSource
extension RepoListVC {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return ds.count
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cellIdentifier = "cellIdentifier"
        var cell = tableView.dequeueReusableCell(withIdentifier: cellIdentifier)
        if cell == nil {
            cell = RepoInfoCell(style: .default, reuseIdentifier: cellIdentifier)
        }
        let cell_t = cell as! RepoInfoCell
        let item = ds[indexPath.row]
        cell_t.resetCell(with: item)
        return cell!;
    }
}
// MARK: - UITableViewDelegate
extension RepoListVC {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
    }
}
extension RepoListVC {
    func resetTableView() {
        table.delegate = self
        table.dataSource = self
        table.estimatedRowHeight = 150
        table.rowHeight = UITableViewAutomaticDimension;
        table.backgroundColor = UIColor.clear
//        table.backgroundColor = UIColor(patternImage: UIImage(named: "bg-4.png")!)
    }
    func masonry() {
        table.snp.makeConstraints { (make) in
            make.edges.equalToSuperview()
        }
    }
}
