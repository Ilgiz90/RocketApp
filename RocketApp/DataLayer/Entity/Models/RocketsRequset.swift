//
//  RocketsRequset.swift
//  RocketApp
//
//  Created by Ilgiz Fazlyev on 05.01.2023.
//

struct RocketsRequset: Decodable {
    let docs: [Rocket]
    let totalDocs: Int
    let offset: Int
    let limit: Int
    let totalPages: Int
    let page: Int
    let pagingCounter: Int
    let hasPrevPage: Bool
    let hasNextPage: Bool
    let prevPage: Int?
    let nextPage: Int?
}
