//
//  TrendingMoviesTrendingMoviesInitializer.swift
//  MovieApp
//
//  Created by nurymsiyrbayev on 30/05/2021.
//  Copyright © 2021 Nurym IOS Dev. All rights reserved.
//

import UIKit

class TrendingMoviesModuleInitializer: NSObject {

    func viewController(collection: MovieCollections) -> UIViewController {
        let storyboard = UIStoryboard(name: "TrendingMovies", bundle: Bundle.main)
        let vc = storyboard.instantiateViewController(withIdentifier: "TrendingMoviesViewController") as! TrendingMoviesViewController
        let configurator = TrendingMoviesModuleConfigurator()
        configurator.configureModuleForViewInput(viewInput: vc, collection: collection)
        
        return vc
    }
}
