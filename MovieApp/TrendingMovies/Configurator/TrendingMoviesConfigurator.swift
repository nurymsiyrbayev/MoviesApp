//
//  TrendingMoviesTrendingMoviesConfigurator.swift
//  MovieApp
//
//  Created by nurymsiyrbayev on 30/05/2021.
//  Copyright © 2021 Nurym IOS Dev. All rights reserved.
//

import UIKit

class TrendingMoviesModuleConfigurator {

    func configureModuleForViewInput<UIViewController>(viewInput: UIViewController, collection: MovieCollections) {

        if let viewController = viewInput as? TrendingMoviesViewController {
            configure(viewController: viewController, collection: collection)
        }
    }

    private func configure(viewController: TrendingMoviesViewController, collection: MovieCollections) {

        let router = TrendingMoviesRouter()

        let presenter = TrendingMoviesPresenter(colection: collection)
        presenter.view = viewController
        presenter.router = router

        let interactor = TrendingMoviesInteractor()
        interactor.output = presenter

        presenter.interactor = interactor
        viewController.output = presenter
    }

}
