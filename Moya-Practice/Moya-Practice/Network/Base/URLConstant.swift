//
//  URLConstant.swift
//  Moya-Practice
//
//  Created by soyeon on 2022/02/09.
//

import Foundation

struct URLConstant {
    
    // MARK: - base URL
    
    static let baseURL = "https://asia-northeast3-naverblog-server.cloudfunctions.net/api"
    
    // MARK: - Like
    
    static let likePost = "/post"
    
    static func sendLikeToPostURL(postId: Int, state: Bool) -> String {
        return baseURL + "/post/\(postId)/like?state=\(state)"
    }
}
