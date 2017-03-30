//
//  RepoListVC.swift
//  MyGitHub
//
//  Created by John LXThyme on 2017/3/28.
//  Copyright © 2017年 John LXThyme. All rights reserved.
//

import UIKit
import SnapKit
import SWTableViewCell
class RepoListVC: BaseVC, UITableViewDelegate, UITableViewDataSource, SWTableViewCellDelegate {
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
        var cell: RepoInfoCell? = tableView.dequeueReusableCell(withIdentifier: cellIdentifier) as? RepoInfoCell
        if cell == nil {
            cell = RepoInfoCell(style: .default, reuseIdentifier: cellIdentifier)
            cell?.rightUtilityButtons = rightUtilityButtons()
            cell?.delegate = self
        }
        let item = ds[indexPath.row]
        cell?.resetCell(with: item)
        return cell!;
    }
}
// MARK: - UITableViewDelegate
extension RepoListVC {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
    }
}
// MARK: - SWTableViewCellDelegate
extension RepoListVC {
    func rightUtilityButtons() -> [Any] {
        let rightItems = NSMutableArray()
        rightItems.sw_addUtilityButton(with: UIColor.green, title: "Move")
        rightItems.sw_addUtilityButton(with: UIColor.purple, title: "Unstar")
        let array = NSArray(array: rightItems)
        return array as! [Any]
    }
    func swipeableTableViewCellShouldHideUtilityButtons(onSwipe cell: SWTableViewCell!) -> Bool {
        return true
    }
    func swipeableTableViewCell(_ cell: SWTableViewCell!, didTriggerRightUtilityButtonWith index: Int) {
        switch index {
        case 0:
            print("Move")
        case 1:
            print("Unstar")
        default:
            assert(true, "ERROR")
        }
    }
}
// MARK: - UI
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
