//
//  LIkeModel.swift
//  Moya-Practice
//
//  Created by soyeon on 2022/02/09.
//


import Foundation

// MARK: - Like Request

struct LikeRequest: Codable {
    let postId: Int
    let state: Bool
}
