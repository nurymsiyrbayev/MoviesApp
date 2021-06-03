//
//  TrendingMoviesTrendingMoviesRouter.swift
//  MovieApp
//
//  Created by nurymsiyrbayev on 30/05/2021.
//  Copyright © 2021 Nurym IOS Dev. All rights reserved.
//
import UIKit

class TrendingMoviesRouter: TrendingMoviesRouterInput {
    func openMovieDetails(with id: Int, controller: UIViewController) {
        let newController = MovieDetailsModuleInitializer().viewController(with: id)
        controller.navigationController?.pushViewController(newController, animated: true)
    }
    
   
}
