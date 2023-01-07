//
//  WebAPI.swift
//  RocketApp
//
//  Created by Ilgiz Fazlyev on 05.01.2023.
//

import Alamofire
import Foundation
import RxAlamofire
import RxSwift

class WebAPI: WebAPIProtocol {
        
    // MARK: - Variables
    
    private let apiURL: String
    private lazy var session = Session.default

    
    init(apiConstants: WebConstants) {
        self.apiURL = apiConstants.baseURL + apiConstants.apiVersion
    }
    
    // MARK: - make request
    
    func request(
        method: Alamofire.HTTPMethod,
        path: String,
        parameters: [String: Any]?,
        encodingType: EncodingType = .http
    ) -> Observable<(HTTPURLResponse, Any)> {
        let fullPath = apiURL + path
        return session.rx.responseJSON(
            method,
            fullPath,
            parameters: parameters,
            encoding: encodingType.type
        )
        .do(onNext: { [unowned self] response, body in
            guard 200 ... 299 ~= response.statusCode else {
                throw createError(response)
            }
        })
    }
    
    // MARK: - download data
    
    func download(
        method: Alamofire.HTTPMethod,
        url: URL
    ) -> Observable<Data> {
        session.rx.responseData(method, url)
            .do(onNext: { [unowned self] response, body in
                guard 200 ... 299 ~= response.statusCode else {
                    throw createError(response)
                }
            })
            .map { $0.1 }
    }
    
}
// MARK: - private functions

private extension WebAPI {
    
    // MARK: - create error
    
    func createError(
        _ response: HTTPURLResponse
    ) -> APIError {
        
        let message = HTTPURLResponse.localizedString(
            forStatusCode: response.statusCode
        )
        
        return APIError(
            code: response.statusCode,
            message: message
        )
    }
}
