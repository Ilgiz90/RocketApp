//
//  UseCaseRocketListAssembly.swift
//  RocketApp
//
//  Created by Ilgiz Fazlyev on 06.01.2023.
//

import EasyDi

class UseCaseRocketListAssembly: Assembly {
    
    var useCase: UseCaseRocketList {
        define(
            scope: .lazySingleton,
            init: UseCaseRocketList(
                repository: self.rocketRepositoryAssembly.repository
            ))
    }
    
    private lazy var rocketRepositoryAssembly: RocketRepositoryAssembly = context.assembly()
}
