//
//  RocketDataAssembly.swift
//  RocketApp
//
//  Created by Ilgiz Fazlyev on 06.01.2023.
//

import EasyDi

class RocketDataAssembly: Assembly {
    
    var remote: RocketDataSorceProtocol {
        define(
            scope: .lazySingleton,
            init: RocketRemoteDataSource(
                api: self.webAPIAssembly.webAPI
            ))
    }
    
    private lazy var webAPIAssembly: WebAPIAssembly = context.assembly()
}
