//
//  NewsService.swift
//  MVVMNews
//
//  Created by soyeon on 2021/08/14.
//

import Foundation
import Moya

enum NewsService {
    case top(param: NewsRequest)
    case everything(keyword: String)
}

extension NewsService: TargetType{
    // 서버 도메인
    public var baseURL: URL {
        return URL(string: GeneralAPI.baseURL)!
    }
    
    // 서버 도메인 뒤에 추가 될 Path
    var path: String {
        switch self {
        case .top:
            return "/top-headlines"
        case .everything:
            return "/everything"
        }
    }
    
    var method: Moya.Method {
        switch self {
        case .top:
            return .get
        case .everything:
            return .get
        }
    }
    
    // 테스트 용 목업 데이터
    var sampleData: Data {
        return "@@".data(using: .utf8)!
    }
    
    // 리퀘스트에 들어갈 파라미터 설정
    var task: Task {
        switch self {
        case .top:
            return .requestParameters(parameters: ["country": "us", "apiKey": GeneralAPI.apiKey], encoding: URLEncoding.default)
        case .everything(let keyWord):
            return .requestParameters(parameters: ["q": keyWord, "apiKey": GeneralAPI.apiKey], encoding: URLEncoding.default)
        }
    }
    
    // 헤더 설정 : 모든 endPoint가 JSON 데이터를 반환하므로 아래와 같이 작성
    var headers: [String : String]? {
        switch self {
        default:
            return ["Content-Type": "application/json"]
        }
    }
}
