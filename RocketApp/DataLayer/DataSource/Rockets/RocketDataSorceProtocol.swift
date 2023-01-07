//
//  RocketDataSorceProtocol.swift
//  RocketApp
//
//  Created by Ilgiz Fazlyev on 05.01.2023.
//

import RxSwift

protocol RocketDataSorceProtocol {
    func getRockets() -> Observable<RocketsRequset>
}
