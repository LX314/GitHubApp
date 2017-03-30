//
//  ViewController.swift
//  MyGitHub
//
//  Created by John LXThyme on 2017/3/27.
//  Copyright © 2017年 John LXThyme. All rights reserved.
//
import UIKit

class ViewController: BaseVC {

    @IBOutlet weak var imgView: UIImageView!
    @IBOutlet weak var btnLogin: UIButton!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        imgView.image = UIImage(named: "star.svg")
        imgView.layer.borderColor = UIColor.purple.cgColor
        imgView.layer.borderWidth = 2
    }


}

