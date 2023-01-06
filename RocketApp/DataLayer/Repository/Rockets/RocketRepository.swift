//
//  RocketRepository.swift
//  RocketApp
//
//  Created by Ilgiz Fazlyev on 05.01.2023.
//

import RxSwift

class RocketRepository: RocketRepositoryProtocol {
    
    private let remoteData: RocketDataSorceProtocol
    
    init (remoteData: RocketDataSorceProtocol) {
        self.remoteData = remoteData
    }
    
    func getRockets() -> Observable<RocketsRequset> {
        remoteData.getRockets()
    }
    
    
}
