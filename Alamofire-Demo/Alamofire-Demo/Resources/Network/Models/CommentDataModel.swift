//
//  CommentDataModel.swift
//  Alamofire-Demo
//
//  Created by soyeon on 2021/11/30.
//

import Foundation

struct CommentResponseModel: Codable {
    let success: Bool
    let message: String
    let data: CommentResponse?
}

struct CommentResponse: Codable {
    let commentNum: String
    let secretCommentNum: Int
    let comments: [Comment]
}

struct Comment: Codable {
    let commentID, groupID: Int
    let userName: String
    let isOwner: Bool
    let content: String
    let heartNum: Int
    let isLike: Bool
    let createdAt: String
    let reply: [Comment]?

    enum CodingKeys: String, CodingKey {
        case commentID = "commentId"
        case groupID = "groupId"
        case userName, isOwner, content, heartNum, isLike, createdAt, reply
    }
}
