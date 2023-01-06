//
//  RocketRemoteDataSource.swift
//  RocketApp
//
//  Created by Ilgiz Fazlyev on 05.01.2023.
//

import RxSwift

class RocketRemoteDataSource: RocketDataSorceProtocol {
    
    private let api: WebAPIProtocol
    
    public init(api: WebAPIProtocol) {
        self.api = api
    }
    
    func getRockets() -> Observable<RocketsRequset> {
        api.request(
            method: .post,
            path: "/rockets/query",
            parameters: nil,
            encodingType: .http
        )
        .mapToObject()
    }
}
