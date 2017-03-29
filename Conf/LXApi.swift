//
//  LXApi.swift
//  MyGitHub
//
//  Created by John LXThyme on 2017/3/27.
//  Copyright © 2017年 John LXThyme. All rights reserved.
//

import UIKit

//GitHub 参数配置
let kClientID = "86c2568b2f7c6400fa0c"
let kClientSecret = "5900210054ac210d95220db41b187d3682e76af8"
let kHomepageUrl = "http://github.com/LX314"
let kCallbackUrl = "http://github.com/LX314"
let kApiState = "314"
var kGitHubAccessToken = ""
let kGitHubScope = "user,repo,gist"
let kApiBaseURL = "https://github.com/"
var kGitHubStarredRepoList = [[String: Any]]()

//let kApiOAuth = "users/whatever?client_id=" + kClientID  + "&client_secret=" + kClientSecret
// GitHub Api
/** 获取授权 code*/
let kApiGetCode = "https://github.com/login/oauth/authorize"
/** 获取 access_token*/
let kApiGetAccessToken = "https://github.com/login/oauth/access_token"
let kGitHubUserName = "LX314"
/** user's repos list[GET][TOKEN]*/
let kApiOwnedRepoList = "https://api.github.com/users/LX314/repos?sort=updated&page=1"
 /** user current starring repo list[GET][TOKEN]*/
let kApiStarredRepoList = "https://api.github.com/user/starred"

/** Get a single user[GET]*/
let kApiUserInfo = "https://api.github.com/users/" + kGitHubUserName
/** List followers of a user[GET]*/
let kApiUserFollwedList = "https://api.github.com/users/" + kGitHubUserName + "/followers"
/** List users followed by another user[GET]*/
let kApiUserFollwingList = "https://api.github.com/users/" + kGitHubUserName + "/following"
class LXApi: NSObject {

}
