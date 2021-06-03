//
//  HomeHomeRouter.swift
//  MovieApp
//
//  Created by nurymsiyrbayev on 02/06/2021.
//  Copyright © 2021 Nurym IOS Dev. All rights reserved.
//

import UIKit

class HomeRouter {

}

// MARK: HomeRouterInput
extension HomeRouter: HomeRouterInput {
    func openMovies(collection: MovieCollections, controller: UIViewController) {
        let newController = TrendingMoviesModuleInitializer().viewController(collection: collection)
        controller.navigationController?.pushViewController(newController, animated: true)
    }
    
    func openMovieDetails(with id: Int, controller: UIViewController) {
        let newController = MovieDetailsModuleInitializer().viewController(with: id)
        controller.navigationController?.pushViewController(newController, animated: true)
    }
}
