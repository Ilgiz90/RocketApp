//
//  UseCaseRocketListProtocol.swift
//  RocketApp
//
//  Created by Ilgiz Fazlyev on 06.01.2023.
//

import RxSwift

protocol UseCaseRocketListProtocol {
    func execute() -> Observable<RocketsRequset>
}
