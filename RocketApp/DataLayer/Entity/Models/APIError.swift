//
//  APIError.swift
//  RocketApp
//
//  Created by Ilgiz Fazlyev on 05.01.2023.
//

struct APIError: Error, Decodable {
    
    var code: Int
    var message: String?
    
    init(
        code: Int,
        message: String?
    ) {
        self.code = code
        self.message = message
    }
}
