//
//  WebAPIMapper.swift
//  RocketApp
//
//  Created by Ilgiz Fazlyev on 05.01.2023.
//

import Foundation
import RxSwift

public extension ObservableType where Element == Any {
    
    // MARK: - map data to model
    
    func mapToObject<T: Decodable>(
        keyDecodingStrategy: JSONDecoder.KeyDecodingStrategy
    ) -> Observable<T> {
        return flatMap({ value -> Observable<T> in
            let jsonDecoder = JSONDecoder()
            jsonDecoder.keyDecodingStrategy = keyDecodingStrategy
            
            guard let jsonData = try? JSONSerialization.data(
                withJSONObject: value,
                options: .prettyPrinted
            ) else {
                return Observable<T>.error(
                    APIError(
                        code: 0,
                        message: "JSON serialization failed"
                    ))
            }
            
            guard let decodedObject = try? jsonDecoder.decode(
                T.self,
                from: jsonData
            ) else {
                return Observable<T>.error(
                    APIError(
                        code: 0,
                        message: "JSON decode failed"
                    ))
            }
            
            return Observable<T>.just(decodedObject)
        })
        .subscribeOn(ConcurrentDispatchQueueScheduler(qos: .background))
        .observeOn(MainScheduler.instance)
    }
}

public extension ObservableType where Element == (HTTPURLResponse, Any) {
   
    // MARK: - extract data from response
    
    func mapToObject<T: Decodable>(
        keyDecodingStrategy: JSONDecoder.KeyDecodingStrategy = .convertFromSnakeCase
    ) -> Observable<T> {
        flatMap { value -> Observable<T> in
            Observable<Any>.just(value.1)
                .mapToObject(
                    keyDecodingStrategy: keyDecodingStrategy
                )
        }
    }
}
