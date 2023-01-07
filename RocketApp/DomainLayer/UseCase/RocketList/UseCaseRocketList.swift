//
//  UseCaseRocketList.swift
//  RocketApp
//
//  Created by Ilgiz Fazlyev on 06.01.2023.
//

import RxSwift

class UseCaseRocketList: UseCaseRocketListProtocol {
    
    private let repository: RocketRepositoryProtocol
    
    init(repository: RocketRepositoryProtocol) {
        self.repository = repository
    }
    
    func execute() -> Observable<RocketsRequset> {
        repository.getRockets()
    }
    
    
}
