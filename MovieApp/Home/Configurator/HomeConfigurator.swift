//
//  HomeHomeConfigurator.swift
//  MovieApp
//
//  Created by nurymsiyrbayev on 02/06/2021.
//  Copyright © 2021 Nurym IOS Dev. All rights reserved.
//

import UIKit

class HomeModuleConfigurator {

    func configureModuleForViewInput<UIViewController>(viewInput: UIViewController) {

        if let viewController = viewInput as? HomeViewController {
            configure(viewController: viewController)
        }
    }

    private func configure(viewController: HomeViewController) {

        let router = HomeRouter()

        let presenter = HomePresenter()
        presenter.view = viewController
        presenter.router = router

        let interactor = HomeInteractor()
        interactor.output = presenter

        presenter.interactor = interactor
        viewController.output = presenter
    }

}
