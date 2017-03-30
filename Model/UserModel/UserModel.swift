//
//  UserModel.swift
//  MyGitHub
//
//  Created by WM on 2017/3/30.
//  Copyright © 2017年 John LXThyme. All rights reserved.
//

import UIKit
import Mantle

class UserModel: MTLModel {
    
    var GHUrl : String = ""
    var GHFollowingUrl : String = ""
    var GHEventUrl : String = ""
    var GHReceiveEventUrl : String = ""
    var GHAvatarUrl : String = ""
    var GHName : String = ""
    var GHtype : String = ""
    var GHSubscriptionsUrl : String = ""
    var GHGistsUrl : String = ""
    var GHId : NSNumber = 0.0
    var GHStarUrl : String = ""
    var GHOrganizationsUrl : String = ""
    var GHReposUrl : String = ""
    var GHEmail : String = ""
    var GHLogin : String = ""
    var GHBlog : String = ""
    var GHPublicRepos : NSNumber = 0.0
    var GHFollowers : NSNumber = 0.0
    var GHFollowing : NSNumber = 0.0
    var GHCreatedAt : String = ""
    var GHFollowerUrl : String = ""
    var GHHtmlUrl : String = ""
    
    class func JSONKeyPathsByPropertyKey() -> NSDictionary {
        return [
                "GHUrl":"url",
                "GHFollowingUrl":"following_url",
                "GHEventUrl":"events_url",
                "GHReceiveEventUrl":"received_events_url",
                "GHAvatarUrl":"avatar_url",
                "GHName":"name",
                "GHtype":"type",
                "GHSubscriptionsUrl":"subscriptions_url",
                "GHGistsUrl":"gists_url",
                "GHId":"id",
                "GHStarUrl":"starred_url",
                "GHOrganizationsUrl":"organizations_url",
                "GHReposUrl":"repos_url",
                "GHEmail":"email",
                "GHLogin":"login",
                "GHBlog":"blog",
                "GHPublicRepos":"public_repos",
                "GHFollowers":"followers",
                "GHFollowing":"following",
                "GHCreatedAt":"created_at",
                "GHFollowerUrl":"followers_url",
                "GHHtmlUrl":"html_url"
        ]
    }
}
