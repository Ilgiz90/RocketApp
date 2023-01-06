//
//  APIError.swift
//  RocketApp
//
//  Created by Ilgiz Fazlyev on 05.01.2023.
//

struct APIError: Error, Decodable {
    
    public var code: Int
    public var message: String?
    
    public init(
        code: Int,
        message: String?
    ) {
        self.code = code
        self.message = message
    }
}
