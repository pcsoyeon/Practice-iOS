//
//  WeatherService.swift
//  Weather
//
//  Created by soyeon on 2021/08/07.
//

import Foundation
import Moya

enum WeatherService {
    case current(param: WeatherRequest)
}

extension WeatherService: TargetType {
    
    // 서버 도메인
    public var baseURL: URL {
        return URL(string: GeneralAPI.baseURL)!
    }
    
    // 서버 도메인 뒤에 추가 될 Path
    var path: String {
        switch self {
        case .current:
            return "/current"
        }
    }
    
    var method: Moya.Method {
        switch self {
        case .current:
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
        case .current:
            return .requestParameters(parameters: ["lat" : 35.7796, "lon" : -78.6382,"key": GeneralAPI.key], encoding: URLEncoding.default)
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


