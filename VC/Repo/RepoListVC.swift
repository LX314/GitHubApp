//
//  RepoListVC.swift
//  MyGitHub
//
//  Created by John LXThyme on 2017/3/28.
//  Copyright © 2017年 John LXThyme. All rights reserved.
//

import UIKit

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

        // Do any additional setup after loading the view.
        table.delegate = self
        table.dataSource = self
        table.rowHeight = 150;
        self.view.addSubview(table)
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
