//
//  LikeService.swift
//  Moya-Practice
//
//  Created by soyeon on 2022/02/09.
//

import Foundation

import Moya

enum LikeService {
    case likePost(parameter: LikeRequest)
}

extension LikeService: BaseTargetType {
    var path: String {
        switch self {
        case .likePost(let parameter):
            return URLConstant.likePost + "/\(parameter.postId)/like"
        }
    }
    
    var method: Moya.Method {
        switch self {
        case .likePost:
            return .patch
        }
    }
    
    var task: Task {
        switch self {
        case .likePost(let parameter):
            return .requestParameters(parameters: ["state" : parameter.state], encoding: URLEncoding.queryString)
        }
    }
    
    var headers: [String : String]? {
        switch self {
        case .likePost:
            return NetworkConstant.noTokenHeader
        }
    }
}
