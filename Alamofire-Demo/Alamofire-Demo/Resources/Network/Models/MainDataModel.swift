//
//  MainDataModel.swift
//  Alamofire-Demo
//
//  Created by soyeon on 2021/11/30.
//

import Foundation

struct MainResponseModel: Codable {
    let success: Bool
    let message: String
    let data: MainResponse?
}

struct MainResponse: Codable {
    let banner: [Banner]
    let posts: [Post]
}

struct Banner: Codable {
    let blogID: Int
    let bannerImage: String
    let todayCount, totalCount: Int
    let blogName, profileName, blogCategory: String
    let neighborNum: Int

    enum CodingKeys: String, CodingKey {
        case blogID = "blogId"
        case bannerImage, todayCount, totalCount, blogName, profileName, blogCategory, neighborNum
    }
}

struct Post: Codable {
    let postID: Int
    let title, content: String
    let heartNum, secretCommentNum: Int
    let isLike: Bool
    let createdAt, commentNum: String

    enum CodingKeys: String, CodingKey {
        case postID = "postId"
        case title, content, heartNum, secretCommentNum, isLike, createdAt, commentNum
    }
}
