//
//  MovieDetailsMovieDetailsInitializer.swift
//  MovieApp
//
//  Created by nurymsiyrbayev on 30/05/2021.
//  Copyright © 2021 Nurym IOS Dev. All rights reserved.
//

import UIKit

class MovieDetailsModuleInitializer: NSObject {

    func viewController(with id: Int) -> UIViewController {
        let storyboard = UIStoryboard(name: "MovieDetails", bundle: Bundle.main)
        let vc = storyboard.instantiateViewController(withIdentifier: "MovieDetailsViewController") as! MovieDetailsViewController
        let configurator = MovieDetailsModuleConfigurator()
        configurator.configureModuleForViewInput(viewInput: vc, movieId: id)
        
        return vc
    }

}
