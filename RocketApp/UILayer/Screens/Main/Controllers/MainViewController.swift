//
//  MainViewController.swift
//  RocketApp
//
//  Created by Ilgiz Fazlyev on 02.01.2023.
//

import UIKit
import EasyDi
import RxSwift

class MainViewController: UIViewController {

    let context: DIContext = DIContext()
    private lazy var useCaseRocketListAssembly: UseCaseRocketListAssembly = context.assembly()
    private let disposeBag = DisposeBag()
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .red
        useCaseRocketListAssembly.useCase.execute()
            .subscribe(onNext: { rockets in
                print(rockets)
            })
            .disposed(by: disposeBag)
    }


}

