//
//  WebAPIProtocol.swift
//  RocketApp
//
//  Created by Ilgiz Fazlyev on 05.01.2023.
//

import RxSwift
import Alamofire
import Foundation

protocol WebAPIProtocol {
    
    func request(
        method: Alamofire.HTTPMethod,
        path: String,
        parameters: [String: Any]?,
        encodingType: EncodingType
    ) -> Observable<(HTTPURLResponse, Any)>
    
    func download(
        method: Alamofire.HTTPMethod,
        url: URL
    ) -> Observable<Data>
}
