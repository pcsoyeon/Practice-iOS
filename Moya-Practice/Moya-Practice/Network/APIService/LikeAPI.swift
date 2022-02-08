//
//  LikeAPI.swift
//  Moya-Practice
//
//  Created by soyeon on 2022/02/09.
//

import Foundation

import Moya

public class LikeAPI {
    static let shared = LikeAPI()
    var likeProvider = MoyaProvider<LikeService>(plugins: [MoyaLoggingPlugin()])
    
    public init() { }
    
    func likePost(parameter: LikeRequest, completion: @escaping (NetworkResult<Any>) -> Void) {
        likeProvider.request(.likePost(parameter: parameter)) { result in
            switch result {
            case .success(let response):
                let statusCode = response.statusCode
                let data = response.data
                
                let networkResult = self.judgeStatus(by: statusCode, data)
                completion(networkResult)
                
            case .failure(let err):
                print(err)
            }
        }
    }
    
    private func judgeStatus(by statusCode: Int, _ data: Data) -> NetworkResult<Any> {
        switch statusCode {
        case 200:
            return isValidLoginData(data: data)
        case 400..<500:
            return isValidLoginData(data: data)
        case 500:
            return .serverErr
        default:
            return .networkFail
        }
    }

    private func isValidLoginData(data: Data) -> NetworkResult<Any> {
        let decoder = JSONDecoder()
        guard let decodedData = try? decoder.decode(GeneralResponse<LikeResponse>.self, from: data)
        else { return .pathErr }
        
        return .success(decodedData)
    }
}
