//
//  RocketRepositoryAssembly.swift
//  RocketApp
//
//  Created by Ilgiz Fazlyev on 06.01.2023.
//

import EasyDi

class RocketRepositoryAssembly: Assembly {
    
    var repository: RocketRepository {
        define(
            scope: .lazySingleton,
            init: RocketRepository(
                remoteData: self.rocketDataAssembly.remote
            ))
    }
    
    private lazy var rocketDataAssembly: RocketDataAssembly = context.assembly()
}
