//
//  RocketRepositoryProtocol.swift
//  RocketApp
//
//  Created by Ilgiz Fazlyev on 05.01.2023.
//

import RxSwift

protocol RocketRepositoryProtocol {
    func getRockets() -> Observable<RocketsRequset>
}
