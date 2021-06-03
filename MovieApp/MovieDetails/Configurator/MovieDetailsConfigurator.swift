//
//  MovieDetailsMovieDetailsConfigurator.swift
//  MovieApp
//
//  Created by nurymsiyrbayev on 30/05/2021.
//  Copyright © 2021 Nurym IOS Dev. All rights reserved.
//

import UIKit

class MovieDetailsModuleConfigurator {

    func configureModuleForViewInput<UIViewController>(viewInput: UIViewController, movieId: Int) {

        if let viewController = viewInput as? MovieDetailsViewController {
            configure(viewController: viewController,  movieId: movieId)
        }
    }

    private func configure(viewController: MovieDetailsViewController, movieId: Int) {

        let router = MovieDetailsRouter()

        let presenter = MovieDetailsPresenter(movieId: movieId)
        presenter.view = viewController
        presenter.router = router

        let interactor = MovieDetailsInteractor()
        interactor.output = presenter

        presenter.interactor = interactor
        viewController.output = presenter
    }

}
