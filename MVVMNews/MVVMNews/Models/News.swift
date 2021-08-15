//
//  News.swift
//  MVVMNews
//
//  Created by soyeon on 2021/08/13.
//

import Foundation

// MARK: - NewsList
struct NewsList: Codable {
    let status: String
    let totalResults: Int
    let articles: [News]
    
    init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        
        status = (try? values.decode(String.self, forKey: .status)) ?? ""
        totalResults = (try? values.decode(Int.self, forKey: .totalResults)) ?? 1
        articles = (try? values.decode([News].self, forKey: .articles)) ?? []
    }
}

// MARK: - News
struct News: Codable {
    let author: String
    let title: String
    let articleDescription: String
    let url: String
    let urlToImage: String
    let content: String
    let publishedAt: String

    enum CodingKeys: String, CodingKey {
        case author, title
        case articleDescription = "description"
        case url, urlToImage, content
        case publishedAt
    }
    
    init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        
        author = (try? values.decode(String.self, forKey: .author)) ?? ""
        title = (try? values.decode(String.self, forKey: .title)) ?? ""
        articleDescription = (try? values.decode(String.self, forKey: .articleDescription)) ?? ""
        url = (try? values.decode(String.self, forKey: .url)) ?? ""
        urlToImage = (try? values.decode(String.self, forKey: .urlToImage)) ?? ""
        content = (try? values.decode(String.self, forKey: .content)) ?? ""
        publishedAt = (try? values.decode(String.self, forKey: .publishedAt)) ?? ""
    }
}

// MARK: - Source
struct Source: Codable {
    let id: String?
    let name: String
    
    init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        
        id = (try? values.decode(String.self, forKey: .id)) ?? ""
        name = (try? values.decode(String.self, forKey: .name)) ?? ""
    }
}
