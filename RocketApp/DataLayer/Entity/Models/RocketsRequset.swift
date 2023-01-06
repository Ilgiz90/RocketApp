//
//  RocketsRequset.swift
//  RocketApp
//
//  Created by Ilgiz Fazlyev on 05.01.2023.
//

struct RocketsRequset: Decodable {
    let docs: [Rocket]
    let totalDocs, offset, limit, totalPages: Int
    let page, pagingCounter: Int
    let hasPrevPage, hasNextPage: Bool
    let prevPage, nextPage: Int?
}
