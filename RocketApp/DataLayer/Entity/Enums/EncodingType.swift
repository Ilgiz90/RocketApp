//
//  EncodingType.swift
//  RocketApp
//
//  Created by Ilgiz Fazlyev on 05.01.2023.
//

import Alamofire

enum EncodingType {
    case http
    case json
    
    var type: ParameterEncoding {
        switch self {
        case .http:
            return URLEncoding.default
        case .json:
            return JSONEncoding.default
        }
    }
}
