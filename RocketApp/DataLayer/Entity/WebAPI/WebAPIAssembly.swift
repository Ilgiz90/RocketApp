//
//  WebAPIAssembly.swift
//  RocketApp
//
//  Created by Ilgiz Fazlyev on 05.01.2023.
//

import EasyDi

class WebAPIAssembly: Assembly {
    
    var webAPI: WebAPIProtocol {
        define(
            scope: .lazySingleton,
            init: WebAPI(
                apiConstants: WebConstants()
            ))
    }
}
