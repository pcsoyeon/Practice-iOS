//
//  UserResponse.swift
//  Moya-Practice
//
//  Created by soyeon on 2022/02/09.
//

import Foundation

// MARK: - UserResponse

struct UserResponse: Codable {
    let totalCount: Int
    let users: [User]
}

// MARK: - User

struct User: Codable {
    let name: String
    let age: Int
}
