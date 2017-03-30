//
//  LXButton.swift
//  MyGitHub
//
//  Created by John LXThyme on 2017/3/30.
//  Copyright © 2017年 John LXThyme. All rights reserved.
//

import UIKit
import SnapKit

class LXButton: UIView {
    var iconSize = CGSize(width: 20, height: 20)
    lazy var btn: UIButton = {
        let btn = UIButton(type: .roundedRect)
        btn.titleLabel?.textAlignment = .left
        return btn
    }()
    lazy var imgView: UIImageView = {
        let imgView = UIImageView()
        return imgView
    }()
    init() {
        super.init(frame: CGRect.zero)
        self.addSubview(btn)
        self.addSubview(imgView)
        masonry()
    }
    init(iconSize: CGSize) {
        super.init(frame: CGRect.zero)
        self.iconSize = iconSize
        self.addSubview(btn)
        self.addSubview(imgView)
        masonry()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

extension LXButton {
    func masonry() {
        let padding = 6.0 as! CGFloat
        let edge = UIEdgeInsets(top: padding, left: padding, bottom: padding, right: padding)
        imgView.snp.makeConstraints { (make) in
            make.top.left.bottom.equalToSuperview().inset(edge)
            make.size.equalTo(iconSize)
        }
        btn.snp.makeConstraints { (make) in
            make.top.bottom.right.equalToSuperview().inset(edge)
            make.left.equalTo(imgView.snp.right).offset(2)
        }
    }
}
